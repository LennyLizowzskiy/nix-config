{ ... }:

{
  services.gnome.gnome-keyring.enable = true;
  services.xserver.updateDbusEnvironment = true;
  programs.seahorse.enable = true;
}