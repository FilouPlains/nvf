{}:

{
  vim.clipboard = {
    enable = true;
    providers.wl-copy.enable = true;

    registers = "unnamedplus";
  };

  vim.filetree.nvimTree.setupOpts.actions.use_system_clipboard = true;
}
