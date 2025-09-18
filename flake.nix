{
  description = "Enable the `strange` Nix environment.";

  inputs = {
    # All latest packages.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , nvf
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };

      configModule = {
        config.vim = {
          theme = {
	    enable = true;
	    name = "nord";
	  };

	  treesitter.enable = true;

          filetree = {
	    nvimTree.setupOpts.view.number = true;
	    nvimTree.setupOpts.view.relativenumber = true;
	  };
        };
      };

      keyConfig = import ./core/keymap.nix { };

      nvim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [
	  configModule
	  keyConfig
	];
      };
    in
    {
      # nix run .#nvim
      packages.nvim = nvim.neovim;
    }
    );
}
