{ pkgs
, lib
}:

let
  # ====================
  # Setting NVF packages
  # ====================
  nvf_package_path = ./upstream;

  # List nix files
  file = builtins.attrNames (builtins.readDir (nvf_package_path));
  nix_file = builtins.filter (name: (builtins.match (".*\\.nix") (name)) != null) (file);
  # Convert to real path.
  nix_file_path = map (name: nvf_package_path + "/${name}") (nix_file);

  # Import and merge sets.
  imported_set = map (file: import file { }) (nix_file_path);
  nvf_package = lib.foldl' (lib.recursiveUpdate ({ }) (fetched_set));

  # ======================
  # Setting local packages
  # ======================
  local_package_path = ./local;

  # List nix files
  file = builtins.attrNames (builtins.readDir nvf_package_path);
  nix_file = builtins.filter (name: (builtins.match (".*\\.nix") (name)) != null) (file);
  # Convert to real path.
  nix_file_path = map (name: local_package_path + "/${name}") (nix_file);

  # Import sets.
  local_package = { vim.startPlugins = map (file: import file { pkgs = pkg; }) (nix_file_path); };

  # ===========
  # Final merge
  # ===========
  merged_set = lib.recursiveUpdate (nvf_package) (local_package);
in
merged_set
# {
#   vim.startPlugins = [
#     (import ./plugin/virtcolumn.nix {
#       buildVimPlugin = buildVimPlugin;
#       fetchFromGitHub = fetchFromGitHub;
#     }).package
#   ];
#
#   vim.luaConfigRC.package =  /* lua */ ''
#     -- require("virtcolumn").setup()
#   '';
#
#   merged_set;
# }
