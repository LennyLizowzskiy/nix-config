{ inputs, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}