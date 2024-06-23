{
  config,
  mainConfig,
  extraArgs,
  lib,
  ...
}:

let
  bg = "${extraArgs.wallpapersDir}/wallpapers/dark-colorful-polygons.png";

  monitors = {
    rher = {
      "eDP-1" = bg;
    };

    grogoroth = {
      "DP-2" = bg;
    };
  };

  getHyprpapers = lib.attrsets.mapAttrsToList (
    name: value: "${name}, ${value}"
  ) monitors."${mainConfig.local.hostname}";
in
{
  # programs.hyprpaper = {
  #   enable = config.wayland.windowManager.hyprland.enable;
  #   systemd.enable = config.wayland.windowManager.hyprland.enable;

  #   settings = {
  #     preload = [ bg ];

  #     wallpapers = getHyprpapers;
  #   };
  # };
}
