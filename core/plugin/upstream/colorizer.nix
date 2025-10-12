_: {
  vim.ui.colorizer = {
    enable = true;

    setupOpts = {
      user_default_options = {
        css = true;
        mode = "background";

        AARRGGBB = true;
        RGB = true;
        RRGGBB = true;
        RRGGBBAA = true;
        names = true;
        css_fn = true;
        tailwind = true;
      };

      filetypes."*" = _;
    };
  };
}
