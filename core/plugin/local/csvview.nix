{pkgs}: let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in {
  package = buildVimPlugin {
    pname = "csvview.nvim";
    version = "v1.3.0";

    src = fetchFromGitHub {
      owner = "hat0uma";
      repo = "csvview.nvim";
      rev = "bbab4c2f808fd8e11ec8dfdd128251aadba566a1";
      hash = "sha256-g67Y+OS3BuwEl9NcXzuBnAyPHHRKssxBuF43dIBLpm4=";
    };
  };
}
