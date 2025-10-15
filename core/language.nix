_: {
  vim.languages = {
    enableTreesitter = true;
    enableFormat = true;

    lua = {
      enable = true;
      lsp.enable = true;
    };

    markdown = {
      enable = true;
      lsp.enable = true;

      extensions = {
        render-markdown-nvim.enable = true;
      };
    };

    nix = {
      enable = true;
      lsp.enable = true;
      extraDiagnostics.enable = true;
    };

    python = {
      enable = true;
      format.type = "ruff";
      lsp.enable = true;
    };

    r = {
      enable = true;
      format.type = "styler";
    };
  };
}
