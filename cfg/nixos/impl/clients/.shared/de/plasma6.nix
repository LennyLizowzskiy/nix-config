{ config, lib, ... }:

lib.mkIf (config.local.de == "plasma6") {
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
