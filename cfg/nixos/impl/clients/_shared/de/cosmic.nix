{
  inputs,
  lib,
  config,
  ...
}:

lib.mkIf (config.local.de == "cosmic") {
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
