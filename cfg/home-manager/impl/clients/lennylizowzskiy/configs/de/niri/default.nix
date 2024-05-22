{
  pkgs,
  lib,
  mainConfig,
  ...
}:

if (mainConfig.local.de == "niri") then
  {
    imports = [
      # inputs.niri-flake.homeModules.config

      ../../gui/wayland/notifications/mako.nix
      ../../gui/wayland/runners/tofi.nix
      ../../gui/wayland/screenshots/swappy.nix
      ../../gui/wayland/statusbars/waybar
      # ../../wayland/statusbars/ironbar

      ../../services/batsignal.nix
      ../../services/udiskie.nix
      ../../services/dconf.nix
      ../../services/secrets/gnome-keyring.nix
    ];

    home.packages = with pkgs; [
      grim
      slurp
      brightnessctl
    ];

    programs.niri = {
      config =
        let
          cfgTxt = "";
        in
        "${cfgTxt}\n${(builtins.readFile ./config.kdl)}";
    };
  }
else
  { }
