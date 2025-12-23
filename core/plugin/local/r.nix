{pkgs}: let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs) lib;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
  buildVimPlugin rec {
    pname = "R.nvim";
    version = "fef990378e4b5157f23314dca4136bc0079cc2c4";

    src = fetchFromGitHub {
      owner = "R-nvim";
      repo = pname;
      rev = version;
      hash = "sha256-KgvK2tR6C97Z1WEUbVNHzAe6QKUg0T5FLB9HwO3eay4=";
    };

    meta = with lib; {
      description = "Intermediate the communication between Neovim and R ";
      homepage = "https://github.com/R-nvim/R.nvim";
      license = licenses.gpl3;
    };
  }
