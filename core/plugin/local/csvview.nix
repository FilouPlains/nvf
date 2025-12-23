{pkgs}: let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
  buildVimPlugin rec {
    pname = "csvview.nvim";
    version = "bbab4c2f808fd8e11ec8dfdd128251aadba566a1";

    src = fetchFromGitHub {
      owner = "hat0uma";
      repo = pname;
      rev = version;
      hash = "sha256-g67Y+OS3BuwEl9NcXzuBnAyPHHRKssxBuF43dIBLpm4=";
    };
  }
