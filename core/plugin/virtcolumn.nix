{ fetchFromGitHub
}:

{
  virtcolumn.nvim = {
    package = fetchFromGitHub {
      owner = "xiyaowong";
      repo = "virtcolumn.nvim";
      rev = "4d385b4aa42aa3af6fa2cb8527462fa4badbd163";
      hash = "";
    };

    setupModule = "virtcolmun";
    setupOpts = {
      option_name = false;
    };
  };
}
