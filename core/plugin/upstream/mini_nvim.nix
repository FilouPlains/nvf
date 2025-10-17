_: {
  vim.mini = {
    surround = {
      enable = true;

      setupOpts = {
        mappings = {
          add = "<Leader>sa";
          delete = "<Leader>sd";
          find = "<Leader>sf";
          find_left = "<Leader>sF";
          highlight = "<Leader>sh";
          replace = "<Leader>sr";
        };
      };
    };
  };
}
