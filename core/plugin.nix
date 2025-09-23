{ buildVimPlugin
, fetchFromGitHub
}:

{
  vim.startPlugins = [
    (import ./plugin/virtcolumn.nix {
      buildVimPlugin = buildVimPlugin;
      fetchFromGitHub = fetchFromGitHub;
    }).package
  ];

  vim.luaConfigRC.package =  /* lua */ ''
    -- require("virtcolumn").setup()
  '';
}
