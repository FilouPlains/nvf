{}: {
  vim.languages = {
    enableTreesitter = true;
    enableFormat = true;

    markdown = {
      enable = true;
      lsp.enable = true;

      extensions = {
        render-markdown-nvim.enable = true;
      };
    };

    lua = {
      enable = true;
      lsp.enable = true;
    };

    python = {
      enable = true;
      lsp.enable = true;
    };

    nix = {
      enable = true;
      lsp.enable = true;
      extraDiagnostics.enable = true;
    };
  };
}
