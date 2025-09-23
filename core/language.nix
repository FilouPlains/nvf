{ }:

{
  vim.languages = {
    enableTreesitter = true;

    markdown = {
      enable = true;
      treesitter.enable = true;

      extensions = {
        render-markdown-nvim.enable = true;
      };
    };

    lua = {
      enable = true;
      treesitter.enable = true;
    };

    python = {
      enable = true;
      treesitter.enable = true;
    };

    nix = {
      enable = true;
      treesitter.enable = true;
      format.enable = true;
    };
  };
}
