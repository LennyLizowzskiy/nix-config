{ ... }:

{
  services.gnome.gnome-keyring.enable = true;
  services.xserver.updateDbusEnvironment = true;
  programs.seahorse.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
}
