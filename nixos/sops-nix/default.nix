{ inputs, pkgs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  home.packages = with pkgs; [
    sops
  ];
}