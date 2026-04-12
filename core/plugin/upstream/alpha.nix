let
  button = [
    {
      label = "  New file";
      key = "n";
      command = ":ene <BAR> startinsert<CR>";
    }
    {
      label = "  Find file";
      key = "f";
      command = ":Telescope find_files<CR>";
    }
    {
      label = "󰷾  Find text";
      key = "g";
      command = ":Telescope live_grep<CR>";
    }
    {
      label = "  File browser";
      key = "b";
      command = ":Yazi<CR>";
    }
    {
      label = "󰄉  Recent files";
      key = "r";
      command = ":Telescope oldfiles<CR>";
    }
    {
      label = "  Quit";
      key = "q";
      command = ":qa<CR>";
    }
  ];

  createButton = {
    label,
    key,
    command,
  }: {
    type = "button";
    val = label;

    opts = {
      shortcut = key;
      keymap = ["n" key command {}];
      position = "center";
      hl_shortcut = "Keyword";
      align_shortcut = "right";
      width = 50;
      cursor = 3;
    };
  };
in
  _: {
    vim.dashboard.alpha = {
      enable = true;
      theme = null;

      layout = [
        {
          type = "padding";
          val = 5;
        }

        {
          type = "text";
          val = [
            "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         "
            "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      "
            "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    "
            "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   "
            "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  "
            "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ "
            "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  "
            " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ "
            " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄"
            "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    "
            "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    "
          ];

          opts = {
            position = "center";
            hl = "Type";
          };
        }

        {
          type = "padding";
          val = 3;
        }

        {
          type = "group";
          val = map createButton button;
          opts = {spacing = 1;};
        }
      ];
    };
  }
