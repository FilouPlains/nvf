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
        pkgs = import nixpkgs {inherit system;};

        nvim = nvf.lib.neovimConfiguration {
          inherit pkgs;

          modules = [
            (import ./core/autocmds.nix {inherit (pkgs) lib;})
            (import ./core/clipboard.nix {})
            (import ./core/keymap.nix {})
            (import ./core/language.nix {})
            (import ./core/lsp.nix {})
            (import ./core/plugin/manager.nix {
              inherit pkgs;
              inherit (pkgs) lib;
            })
            (import ./core/theme.nix {})
            (import ./core/vim_option.nix {})
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
