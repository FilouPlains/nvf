{}: {
  vim.keymaps = [
    # Undo.
    {
      mode = ["n" "v" "i"];
      key = "<C-z>";
      silent = true;
      action = ":u<CR>";
    }
    # Redo.
    {
      mode = ["n" "v" "i"];
      key = "<C-y>";
      silent = true;
      action = "<C-r>";
    }
    # Save.
    {
      mode = ["n"];
      key = "<C-s>";
      silent = true;
      action = ":w<CR>";
    }
    {
      mode = ["v"];
      key = "<C-s>";
      silent = true;
      action = "<Esc>:w<CR>";
    }
    {
      mode = ["i"];
      key = "<C-s>";
      silent = true;
      action = "<Esc>:w<CR>i<Right>";
    }
    # Move lines down.
    {
      mode = ["n"];
      key = "<M-Down>";
      silent = true;
      action = ":m+1<CR>";
    }
    {
      mode = ["n"];
      key = "<M-j>";
      silent = true;
      action = ":m+1<CR>";
    }
    # Move selected lines down.
    {
      mode = ["v"];
      key = "<M-Down>";
      silent = true;
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = ["v"];
      key = "<M-j>";
      silent = true;
      action = ":m '>+1<CR>gv=gv";
    }
    # Move lines up.
    {
      mode = ["n"];
      key = "<M-Up>";
      silent = true;
      action = ":m-2<CR>";
    }
    {
      mode = ["n"];
      key = "<M-k>";
      silent = true;
      action = ":m-2<CR>";
    }
    # Move selected lines up.
    {
      mode = ["v"];
      key = "<M-Up>";
      silent = true;
      action = ":m '<-2<CR>gv=gv";
    }
    {
      mode = ["v"];
      key = "<M-k>";
      silent = true;
      action = ":m '<-2<CR>gv=gv";
    }
    # Retab.
    {
      mode = ["n"];
      key = "<Leader>t";
      silent = true;
      action = ":retab<CR>";
    }
    # Format.
    {
      mode = ["n"];
      key = "<Leader>f";
      silent = true;
      action = ":lua require('conform').format({ async = false })<CR>";
    }
  ];
}
