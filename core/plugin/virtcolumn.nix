{ buildVimPlugin
, fetchFromGitHub
}:

{
  "virtcolumn.nvim" = {
    package = buildVimPlugin {
      pname = "virtcolumn.nvim";
      version = "2023-12-15";

      src = fetchFromGitHub {
        owner = "xiyaowong";
        repo = "virtcolumn.nvim";
        rev = "4d385b4aa42aa3af6fa2cb8527462fa4badbd163";
        hash = "sha256-4Q7dbgu/YxpHTLrMgGzJ2DaAuaH9VhkVTrtlbFmPYZY=";
      };
    };

    setupModule = "virtcolumn";
    setupOpts = {
      option_name = true;
    };
  };
}
