{ config, etcDir, lib, ... }:

let
  pictures =
    let
      wallpaperFolder = "mi";
    in
      {
        nix-flake-lightblue = "${etcDir}/wallpapers/nix-flake-lightblue.png";
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
    monitors.${nixosArgs.config.nixdiffs.machine.name};
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