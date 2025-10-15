_: {
  vim.visuals.indent-blankline = {
    enable = true;

    setupOpts = {
      indent = {
        char = "";
        tab_char = "┃";
      };

      scope = {
        enabled = true;
        char = "┊";
      };
    };
  };
}
