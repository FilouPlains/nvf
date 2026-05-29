{pkgs}: let
  inherit (pkgs) vimPlugins;
in
  vimPlugins.nvim-treesitter-parsers.rnoweb
