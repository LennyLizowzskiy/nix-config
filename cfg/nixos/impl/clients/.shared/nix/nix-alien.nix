{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ nix-alien ];

  programs.nix-ld.enable = true;
}
