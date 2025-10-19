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
      in {
        # nix run .
        packages.default = pkgs.buildEnv {
          name = "nvim";
          paths = [
            # ======
            # Neovim
            # ======
            nvim.neovim

            # ============
            # Dependancies
            # ============
            # S
            pkgs.xsel

            # Y
            pkgs.yazi
          ];
        };
      }
    );
}
