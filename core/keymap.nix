{lib}: {
  vim.keymaps =
    [
      # Undo.
      {
        mode = ["n" "v" "i"];
        key = "<C-z>";
        silent = true;
        action = ":u<CR>";
        desc = "Undo.";
      }
      # Redo.
      {
        mode = ["n" "v" "i"];
        key = "<C-y>";
        silent = true;
        action = "<C-r>";
        desc = "Redo.";
      }
      # Save.
      {
        mode = ["n"];
        key = "<C-s>";
        silent = true;
        action = ":w<CR>";
        desc = "Save current file.";
      }
      {
        mode = ["v"];
        key = "<C-s>";
        silent = true;
        action = "<Esc>:w<CR>";
        desc = "Save current file.";
      }
      {
        mode = ["i"];
        key = "<C-s>";
        silent = true;
        action = "<Esc>:w<CR>i<Right>";
        desc = "Save current file.";
      }
      # Move lines down.
      {
        mode = ["n"];
        key = "<M-Down>";
        silent = true;
        action = ":m+1<CR>";
        desc = "Move current line down.";
      }
      {
        mode = ["n"];
        key = "<M-j>";
        silent = true;
        action = ":m+1<CR>";
        desc = "Move current line down.";
      }
      # Move selected lines down.
      {
        mode = ["v"];
        key = "<M-Down>";
        silent = true;
        action = ":m '>+1<CR>gv=gv";
        desc = "Move current selected line down.";
      }
      {
        mode = ["v"];
        key = "<M-j>";
        silent = true;
        action = ":m '>+1<CR>gv=gv";
        desc = "Move current selected line down.";
      }
      # Move lines up.
      {
        mode = ["n"];
        key = "<M-Up>";
        silent = true;
        action = ":m-2<CR>";
        desc = "Move current line up.";
      }
      {
        mode = ["n"];
        key = "<M-k>";
        silent = true;
        action = ":m-2<CR>";
        desc = "Move current line up.";
      }
      # Move selected lines up.
      {
        mode = ["v"];
        key = "<M-Up>";
        silent = true;
        action = ":m '<-2<CR>gv=gv";
        desc = "Move current selected line up.";
      }
      {
        mode = ["v"];
        key = "<M-k>";
        silent = true;
        action = ":m '<-2<CR>gv=gv";
        desc = "Move current selected line up.";
      }
      # Retab.
      {
        mode = ["n"];
        key = "t";
        silent = true;
        action = ":retab<CR>";
        desc = "Replace all tabulation with the right number of spaces.";
      }
      # Format.
      {
        mode = ["n"];
        key = "f";
        silent = true;
        action = ":lua require('conform').format({ async = false })<CR>";
        desc = "Format current file using conform.";
      }
      # Exit the terminal using <Esc> key.
      {
        mode = ["t"];
        key = "<Esc>";
        silent = true;
        action = "<C-\\><C-n>";
        desc = "Define so <Esc> work in the terminal to switch back to “normal” mode.";
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
        General mapping function. Currying parttern.

        The main function take a set as parameter. If true, this bind `open` to
        `key`. Else, if false, this bind `close` to key.

        Then, it return taking in argument a set with open and close. This is
        used to generate the keymaps.
        */
        lambdaGeneralMapping = {useOpen}: (
          {
            open,
            close,
          }: {
            mode = ["v"];
            # Open symbol as keymap.
            key =
              if useOpen
              then open
              else close;
            silent = true;
            # Launch MiniSurround.add() and set back the selection.
            # The selection is shift one the right.
            action = ":<C-U>lua MiniSurround.add('visual')<CR>${close}gv<Right>o<Right>o";
            desc = "Add ${open}${close} around current selection.";
          }
        );

        openSymbolMapping = lambdaGeneralMapping {useOpen = true;};
        closeSymbolMapping = lambdaGeneralMapping {useOpen = false;};
      in
        map openSymbolMapping pairSymbolSet
        ++ map closeSymbolMapping pairSymbolSet
    );
}
