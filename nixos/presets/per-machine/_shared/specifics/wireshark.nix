{ pkgs, ... }:

{
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    wireshark
    termshark
  ];
}