{ }:

{
  vim.keymaps = [
    # Undo.
    {
      mode = ["n" "v" "i"];
      key = "<C-z>";
      silent = true;
      action = "<cmd>u<CR>";
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
    # Move lines down.
    {
      mode = ["n"];
      key = "<M-Down>";
      silent = true;
      action = "<cmd>m +1<CR>";
    }
    {
      mode = ["n"];
      key = "<M-j>";
      silent = true;
      action = "<cmd>m +1<CR>";
    }
    # Move lines up.
    {
      mode = ["n"];
      key = "<M-Up>";
      silent = true;
      action = "<cmd>m -2<CR>";
    }
    {
      mode = ["n"];
      key = "<M-k>";
      silent = true;
      action = "<cmd>m -2<CR>";
    }
    # Copy.
    {
      mode = ["v"];
      key = "Y";
      silent = true;
      action = "\"+y";
    }
    # Retab.
    {
      mode = ["n"];
      key = "<Leader-t>";
      silent = true;
      action = "<cmd>retab<CR>";
    }
  ];
}
