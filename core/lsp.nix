{pkgs}: let
  inherit (pkgs) lib;
  inherit (lib.meta) getExe;
in {
  vim.lsp = {
    enable = true;

    mappings = {
      codeAction = "<Leader>c";
      renameSymbol = "<Leader>r";
      hover = "?";
      goToDefinition = "<Leader>g";
      openDiagnosticFloat = "!";
    };

    servers.fish-lsp = {
      enable = true;
      cmd = [(getExe pkgs.fish-lsp) "start"];
      root_markers = [".git"];
      filetypes = ["fish"];
    };
  };
}
