{pkgs}: {
  vim = {
    options = {
      tabstop = 4;
      shiftwidth = 4;

      wrap = false;
    };

    luaConfigRC.configuration =
      /*
      lua
      */
      ''
        vim.cmd("set colorcolumn=80")
      '';

    globals.virtcolumn_char = "┃";

    treesitter.enable = true;

    filetree = {
      nvimTree.setupOpts.view.number = true;
      nvimTree.setupOpts.view.relativenumber = true;
    };
  #
  #   lazy.plugins = {
  #     "csvview.nvim" = {
  #       package = pkgs.vimPlugins.csvview-nvim;
  #       setupModule = "csvview";
  #
  #       setupOpts = {
  #         parser.delimiter = {
  #           ft = {csv = ".";};
  #         };
  #       };
  #     };
  #   };
  };
}
