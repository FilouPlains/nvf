{pkgs}: let
  inherit (pkgs) lib;
in {
  vim.autocmds = [
    {
      enable = true;
      callback =
        lib.generators.mkLuaInline
        /*
        lua
        */
        ''
          function(args)
              vim.keymap.set(
                  "n",
                  "<C-p>",
                  ":CsvViewToggle display_mode=border<CR>",
                  {
                      buffer = args.buf,
                      desc = "Toggle CSV or TSV preview.",
                      silent = true
                  }
              )
          end
        '';
      event = ["FileType"];
      pattern = [
        "csv"
        "tsv"
      ];
      desc = "Enable <C-p> to preview CSV or TSV.";
    }
    {
      enable = true;
      callback =
        lib.generators.mkLuaInline
        /*
        lua
        */
        ''
          function(args)
              vim.keymap.set(
                  "n",
                  "<C-p>",
                  ":TypstPreviewToggle<CR>",
                  {
                      buffer = args.buf,
                      desc = "Toggle typst preview.",
                      silent = true
                  }
              )
          end
        '';
      event = ["FileType"];
      pattern = [
        "typst"
      ];
      desc = "Enable <C-p> to preview typst file.";
    }
    {
      enable = true;
      callback =
        lib.generators.mkLuaInline
        /*
        lua
        */
        ''
          function(args)
              vim.keymap.set(
                  "n",
                  "<C-p>",
                  ":LivePreview start<CR>",
                  {
                      buffer = args.buf,
                      desc = "Toggle HTML preview.",
                      silent = true
                  }
              )
          end
        '';
      event = ["FileType"];
      pattern = [
        "html"
      ];
      desc = "Enable <C-p> to preview HTML file.";
    }
  ];
}
