{ buildVimPlugin
, fetchFromGitHub
, pkgs
}:

{
  config.vim.lazy.plugins = {
    "virtcolumn.nvim" = (import ./plugin/virtcolumn.nix {
      buildVimPlugin = buildVimPlugin;
      fetchFromGitHub = fetchFromGitHub;
    })."virtcolumn.nvim";

    "aerial.nvim" = {
      package = pkgs.vimPlugins.aerial-nvim;
      setupModule = "aerial";
      setupOpts = {
        option_name = true;
      };
    };
  };
}
