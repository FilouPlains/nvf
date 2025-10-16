{lib}: {
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
                  {buffer = args.buf, desc = "Toggle CSV or TSV preview."}
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
  ];
}
