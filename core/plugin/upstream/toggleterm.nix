_: {
  vim.terminal.toggleterm = {
    enable = true;

    /*
    We cannot use `{}` syntaxe, as it is breaking things.
    */
    setupOpts.direction = "vertical";
    setupOpts.size = 80;

    # Adding LazyGit support.
    lazygit = {
      enable = true;
      direction = "float";

      mappings.open = "G";
    };
  };
}
