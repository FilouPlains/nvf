_: {
  vim.notify.nvim-notify = {
    enable = true;

    setupOpts = {
      position = "top_right";

      icons = {
        DEBUG = "󰮔 ";
        ERROR = " ";
        INFO = " ";
        TRACE = "󰛿 ";
        WARN = " ";
      };

      render = "default";
      stages = "slide";
      timeout = 5000;
    };
  };
}
