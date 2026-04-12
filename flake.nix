{
  description = "Enable the `strange` Nix environment.";

  inputs = {
    # All latest packages.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nvf,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        # ===================
        # Import Nix packages
        # ===================
        pkgs = import nixpkgs {inherit system;};

        # ===============
        # Import NVF core
        # ===============
        core_path = ./core;

        # List nix files
        core_file = builtins.attrNames (builtins.readDir core_path);
        core_nix_file = builtins.filter (name: (builtins.match ".*\\.nix" name) != null) core_file;
        # Convert to real path.
        core_file_path = map (name: core_path + "/${name}") core_nix_file;
        core_package = map (file: import file {inherit pkgs;}) core_file_path;

        # =========
        # Setup NVF
        # =========
        nvim = nvf.lib.neovimConfiguration {
          inherit pkgs;

          modules =
            core_package
            ++ [
              (import ./core/plugin/manager.nix {
                inherit pkgs;
                inherit (pkgs) lib;
              })
            ];
        };

        nvimcom = pkgs.rPackages.buildRPackage rec {
          name = "nvimcom";
          version = "fef990378e4b5157f23314dca4136bc0079cc2c4";

          src = pkgs.fetchFromGitHub {
            owner = "R-nvim";
            repo = "R.nvim";
            rev = version;
            hash = "sha256-KgvK2tR6C97Z1WEUbVNHzAe6QKUg0T5FLB9HwO3eay4=";
          };

          configurePhase =
            /*
            bash
            */
            ''
              cd nvimcom
            '';

          meta = with pkgs.lib; {
            description = "Intermediate the communication between Neovim and R ";
            homepage = "https://github.com/R-nvim/R.nvim";
            license = licenses.gpl3;
          };
        };

        # nvimcom = pkgs.rPackages.buildRPackage {
        #   name = "nvimcom";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "jalvesaq";
        #     repo = "nvimcom";
        #     rev = "master"; # or a specific commit for reproducibility
        #     sha256 = pkgs.lib.fakeSha256; # run once, Nix will tell you real one
        #   };
        #   # propagatedBuildInputs = with pkgs.rPackages; []; # no deps
        # };

        # Custom R with nvimcom
        myR = pkgs.rWrapper.override {
          packages = with pkgs.rPackages; [
            nvimcom
            styler
          ];
        };
      in {
        packages.default = pkgs.writeShellApplication {
          name = "NVF";

          runtimeInputs =
            (with pkgs; [
              # ======
              # Neovim
              # ======
              nvim.neovim

              # ============
              # Dependancies
              # ============
              # G
              git

              # L
              lazygit

              # R
              myR
              radian
              ripgrep

              # X
              xsel

              # Y
              yazi
            ])
            ++ (with pkgs.vimPlugins; [
              # ==========
              # Treesitter
              # ==========
              # N
              nvim-treesitter-parsers.jsonnet
              nvim-treesitter-parsers.yaml
            ]);

          text = "exec nvim \"$@\"";
        };
      }
    );
}
