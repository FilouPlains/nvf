{lib}: {
  vim.keymaps =
    [
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
        key = "t";
        silent = true;
        action = ":retab<CR>";
      }
      # Format.
      {
        mode = ["n"];
        key = "f";
        silent = true;
        action = ":lua require('conform').format({ async = false })<CR>";
      }
      # Exit the terminal using <Esc> key.
      {
        mode = ["t"];
        key = "<Esc>";
        silent = true;
        action = "<C-\\><C-n>";
      }
      # Add "", (), {}, [], '', `` arround selection.
      {
        mode = ["v"];
        key = "(";
        silent = false;
        action = ":<C-U>lua MiniSurround.add('visual')<CR>)gv<Right>o<Right>o";
        desc = "Add () arround current selection.";
      }
    ]
    # To add `symbol` arround current selection.
    ++ (
      let
        /*
        Define the symbol. Note that each will be mapped to a keymap.
        So in `()`, `(` and `)` are going to be a keymap.
        */
        symbolList = [
          "()"
          "[]"
          "{}"
          "``"
          "''"
          "\"\""
        ];

        /*
        Transform every symbol in a set. So `()` is going to be
        `{open = "("; close = ")";}`.
        */
        pairSymbolSet =
          map (symbolI: let
            symbol = lib.stringToCharacters symbolI;
          in {
            open = builtins.elemAt symbol 0;
            close = builtins.elemAt symbol 1;
          })
          symbolList;

        /*
        Create the keymapping.
        */
        lambdaSymbolMapping = {
          open,
          close,
        }: {
          mode = ["v"];
          # Open symbol as keymap.
          key = open;
          silent = true;
          # Launch MiniSurround.add() and set back the selection.
          # The selection is shift one the right.
          action = ":<C-U>lua MiniSurround.add('visual')<CR>${close}gv<Right>o<Right>o";
          desc = "Add ${open}${close} around current selection.";
        };

        /*
        Same as above, just change the keymapping.
        */
        lambdaInvertSymbolMapping = {
          open,
          close,
        }: {
          mode = ["v"];
          # Open symbol as keymap.
          key = close;
          silent = true;
          action = ":<C-U>lua MiniSurround.add('visual')<CR>${close}gv<Right>o<Right>o";
          desc = "Add ${open}${close} around current selection.";
        };
      in
        map lambdaSymbolMapping pairSymbolSet
        ++ map lambdaInvertSymbolMapping pairSymbolSet
    );
}
