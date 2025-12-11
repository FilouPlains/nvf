{pkgs}: let
  inherit (pkgs) lib;
in {
  vim.keymaps =
    [
      # Undo.
      {
        mode = ["n"];
        key = "<C-z>";
        silent = true;
        action = ":u<CR>";
        desc = "Undo.";
      }
      {
        mode = ["v"];
        key = "<C-z>";
        silent = true;
        action = "<Esc>:u<CR>gv";
        desc = "Undo.";
      }
      {
        mode = ["i"];
        key = "<C-z>";
        silent = true;
        action = "<Esc>:u<CR>a";
        desc = "Undo.";
      }
      # Redo.
      {
        mode = ["n"];
        key = "<C-y>";
        silent = true;
        action = "<C-r>";
        desc = "Redo.";
      }
      {
        mode = ["v"];
        key = "<C-y>";
        silent = true;
        action = "<Esc><C-r>gv";
        desc = "Redo.";
      }
      {
        mode = ["i"];
        key = "<C-y>";
        silent = true;
        action = "<Esc><C-r>a";
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
        action = "<Esc>:w<CR>gv";
        desc = "Save current file.";
      }
      {
        mode = ["i"];
        key = "<C-s>";
        silent = true;
        action = "<Esc>:w<CR>a";
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
          "$$"
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
    )
    ++ [
      # When exiting insert mode, shift one to the right.
      {
        mode = ["i"];
        key = "<Esc>";
        silent = true;
        noremap = true;
        action = "<Esc><Right>";
        desc = "Shift one to the right after exiting insert modify.";
      }
    ]
    # To switch pannel using <C-> + arrow keys or vim motion.
    ++ (
      let
        keySet = {
          "Left" = "h";
          "Right" = "l";
          "Up" = "k";
          "Down" = "j";
        };

        lambdaGeneralShiftPannel = isArrow: (
          name: value: {
            mode = ["n"];
            key =
              if isArrow
              then "<M-${name}>"
              else "<M-${value}>";
            silent = true;
            action = "<C-w><${name}>";
            desc = "Go to ${lib.strings.toLower name} pannel.";
          }
        );

        lambdaShiftPannelArrow = lambdaGeneralShiftPannel true;
        lambdaShiftPannelVimMotion = lambdaGeneralShiftPannel false;
      in
        lib.mapAttrsToList lambdaShiftPannelArrow keySet
        ++ lib.mapAttrsToList lambdaShiftPannelVimMotion keySet
    )
    ++ [
      {
        mode = ["n"];
        key = "<Leader><Left>";
        silent = true;
        noremap = true;
        action = ":vsplit<CR><C-w><Left>";
        desc = "Split vertically and stay on current pannel.";
      }
      {
        mode = ["n"];
        key = "<Leader><Right>";
        silent = true;
        noremap = true;
        action = ":vsplit<CR>";
        desc = "Split vertically and go on openned pannel.";
      }
      {
        mode = ["n"];
        key = "<Leader><Up>";
        silent = true;
        noremap = true;
        action = ":split<CR><C-w><Up>";
        desc = "Split horizontally and stay on current pannel.";
      }
      {
        mode = ["n"];
        key = "<Leader><Down>";
        silent = true;
        noremap = true;
        action = ":split<CR>";
        desc = "Split horizontally and go on openned pannel.";
      }
    ];
}
