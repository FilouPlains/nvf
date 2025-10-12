_: {
  vim.terminal.toggleterm = {
    enable = true;
    setupOpts.direction = "vertical";

    # Adding LazyGit support.
    lazygit = {
      enable = true;
      direction = "float";

      mappings.open = "g";
    };
  };
}
