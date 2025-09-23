{}:

{
  vim.options = {
    tabstop = 4;
    shiftwidth = 4;
  };

  vim.luaConfigRC.configuration =  /* lua */ ''
    vim.cmd("set colorcolumn=80")
  '';

  vim.globals = {
    virtcolumn_char = "┃";
  };
}
