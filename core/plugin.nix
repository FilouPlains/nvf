{ buildVimPlugin
, fetchFromGitHub
, pkgs
}:

{
  vim.startPlugins = [
    pkgs.vimPlugins.aerial-nvim
    (import ./plugin/virtcolumn.nix {
      buildVimPlugin = buildVimPlugin;
      fetchFromGitHub = fetchFromGitHub;
    }).package
  ];

  # config.vim.lazy.plugins = {
  #   "aerial.nvim" = {
  #     package = pkgs.vimPlugins.aerial-nvim;
  #     setupModule = "aerial";
  #     setupOpts = {
  #       option_name = true;
  #     };
  #   };
  # };
}
