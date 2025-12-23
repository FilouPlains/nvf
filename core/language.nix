_: {
  vim.languages = {
    enableTreesitter = true;
    enableFormat = true;
    enableExtraDiagnostics = true;

    bash = {
      enable = true;
      lsp.enable = true;
    };

    css = {
      enable = true;
      lsp.enable = true;
    };

    html = {
      enable = true;

      lsp = {
        enable = true;
        servers = ["emmet-ls"];
      };

      treesitter.autotagHtml = true;
    };

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
    };

    python = {
      enable = true;
      format.type = ["ruff"];
      lsp.enable = true;
    };

    r = {
      enable = true;
      format.type = ["styler"];
    };

    # For typescript and javascript.
    ts = {
      enable = true;
      lsp.enable = true;
    };

    typst = {
      enable = true;
      lsp.enable = true;

      extensions = {
        typst-preview-nvim.enable = true;
      };
    };

    yaml = {
      enable = true;
      lsp.enable = true;
    };
  };
}
