{
  fetchFromGitHub
}:

{
 [
   (import core/plugin/virtcolumn.nix { fetchFromGitHub; })
 ];
}
