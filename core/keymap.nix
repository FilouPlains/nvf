  vim.keymaps = [
    {
      mode = ["n", "v"];
      key = "<C-u>";
      silent = true;
      action = "<cmd>u<CR>";
    }
    {
      mode = ["n"];
      key = "<C-s>";
      silent = true;
      action = "<cmd>w<CR>";
    }
    {
      mode = ["v"];
      key = "<C-s>";
      silent = true;
      action = "<Esc><cmd>w<CR>";
    }
    {
      mode = ["i"];
      key = "<C-s>";
      silent = true;
      action = "<Esc><cmd>w<CR>i<Right>";
    }
  ];

