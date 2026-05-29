{
  pkgs,
  lib,
}: let
  # ====================
  # Setting NVF packages
  # ====================
  nvf_package_path = ./upstream;

  # List nix files
  nvf_file = builtins.attrNames (builtins.readDir nvf_package_path);
  nvf_nix_file = builtins.filter (name: (builtins.match ".*\\.nix" name) != null) nvf_file;
  # Convert to real path.
  nvf_file_path = map (name: nvf_package_path + "/${name}") nvf_nix_file;

  # Import and merge sets.
  imported_set = map (file: import file {inherit pkgs;}) nvf_file_path;
  nvf_package = (lib.foldl' lib.recursiveUpdate {}) imported_set;

  # ======================
  # Setting local packages
  # ======================
  local_package_path = ./local;

  # List nix files
  local_file = builtins.attrNames (builtins.readDir local_package_path);
  local_nix_file = builtins.filter (name: (builtins.match ".*\\.nix" name) != null) local_file;
  # Convert to real path.
  local_file_path = map (name: local_package_path + "/${name}") local_nix_file;

  # Import sets.
  local_package = map (file: import file {inherit pkgs;}) local_file_path;

  # ===========
  # Final merge
  # ===========
  merged_set = lib.recursiveUpdate nvf_package {vim.startPlugins = local_package;};
in
  merged_set
