{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    via
    vial
    qmk
  ];

  services.udev.packages = with pkgs; [
    via
    qmk-udev-rules
  ];

  hardware.keyboard.qmk.enable = true;
}