{ config, extraArgs, lib, ... }:

let
  pictures =
    let
      wallpaperFolder = "mi";
    in
      {
        nix-flake-lightblue = "${extraArgs.etcDir}/wallpapers/circuit.png";
      };

  monitors = with pictures; {
    rher = {
      "eDP-1" = nix-flake-lightblue;
    };

    grogoroth = {
      "DP-2" = nix-flake-lightblue;
    };
  };

  getHyprpapers = lib.attrsets.mapAttrsToList
    (name: value: "${name}, ${value}")
    monitors.rher;
in
{
  programs.hyprpaper = {
    enable = config.wayland.windowManager.hyprland.enable;
    systemd.enable = config.wayland.windowManager.hyprland.enable;

    settings = {
      preload = builtins.attrValues pictures;

      wallpapers = getHyprpapers;
    };
  };
}