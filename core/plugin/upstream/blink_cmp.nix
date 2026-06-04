{pkgs}: let
  inherit (pkgs) lib;
in {
  vim.autocomplete.blink-cmp = {
    enable = true;

    mappings = {
      next = "<S-Down>";
      previous = "<S-Up>";
      confirm = "<Tab>";
    };

    friendly-snippets = {
      enable = true;
    };

    sourcePlugins.ripgrep.enable = true;

    setupOpts.sources.providers.ripgrep.opts = {
      backend.ripgrep = {
        max_filesize = "1024";
        additional_rg_options = [
          "--max-columns=150"
        ];
      };
    };
  };
}
