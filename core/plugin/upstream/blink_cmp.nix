_: {
  vim.autocomplete.blink-cmp = {
    enable = true;

    mappings = {
      next = "<S-Down>";
      previous = "<S-Up>";
      confirm = "<Tab>";
    };

    friendly-snippets = {
      enable = true;
    };

    sourcePlugins = {
      ripgrep = {
        enable = true;
      };
    };
  };
}
