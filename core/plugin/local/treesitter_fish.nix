{pkgs}:
pkgs.tree-sitter.buildGrammar rec {
  language = "fish";
  version = "3.7.0";

  src = pkgs.fetchFromGitHub {
    owner = "ram02z";
    repo = "tree-sitter-fish";
    rev = version;
    sha256 = "sha256-n6eGMdbW1Rsn5XbszLSSSG3F8jh+loYnPEiabNY+jfk=";
  };
}
