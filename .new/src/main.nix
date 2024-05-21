{ ... }:

{
  imports = [
    ./nixos/modules/local.nix
  ];

  local = {
    shell = "fish";
    de = "sway";
    terminal = "foot";
  };
}