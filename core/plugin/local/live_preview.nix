{pkgs}: let
  inherit (pkgs) vimPlugins;
in
  vimPlugins.live-preview-nvim
