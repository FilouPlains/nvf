{pkgs}: let
  inherit (pkgs.vimPlugins) telescope-fzf-native-nvim;
in {
  vim.telescope = {
    enable = true;

    extensions = [
      {
        name = "fzf";
        packages = [telescope-fzf-native-nvim];
        setup = {fzf = {fuzzy = true;};};
      }
    ];

    mappings = {
      buffers = "<Leader>tb";
      diagnostics = "<Leader>tld";
      findFiles = "<Leader>tf";
      findProjects = "<Leader>tp";
      gitBranches = "<Leader>tvb";
      gitBufferCommits = "<Leader>tvcb";
      gitCommits = "<Leader>tvcw";
      gitStash = "<Leader>tvx";
      gitStatus = "<Leader>tvs";
      helpTags = "<Leader>th";
      liveGrep = "<Leader>tg";
      lspDefinitions = "<Leader>tlD";
      lspDocumentSymbols = "<Leader>tlsb";
      lspImplementations = "<Leader>tli";
      lspReferences = "<Leader>tlr";
      lspTypeDefinitions = "<Leader>tlt";
      lspWorkspaceSymbols = "<Leader>tlsw";
      open = "<Leader>tt";
      resume = "<Leader>tr";
      treesitter = "<Leader>ts";
    };
  };
}
# .package function

