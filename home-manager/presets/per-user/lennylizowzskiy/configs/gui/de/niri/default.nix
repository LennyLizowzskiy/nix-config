{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.niri-flake.homeModules.config

    ../../wayland/notifications/mako.nix
    ../../wayland/runners/tofi.nix
    ../../wayland/screenshots/swappy.nix
    ../../wayland/statusbars/waybar
    # ../../wayland/statusbars/ironbar

    ../../../services/batsignal.nix
    ../../../services/udiskie.nix
    ../../../services/dconf.nix
    ../../../services/secrets/gnome-keyring.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    brightnessctl
  ];

  programs.niri = {
    settings = {
      prefer-no-csd = true;

      output = {
        "DP-2".mode = "2560x1440@142.000";
      };

      input = {
        workspace-auto-back-and-forth = true;

        keyboard = {
          track-layout = "global";

          xkb = {
            layout = "us,ru";
            options = "grp:toggle,numpad:mac";
          };
        };

        # touchpad = {

        # };
      };

      binds = {
        "Mod+H".focus-column-left = true;
        "Mod+J".focus-workspace-down = true;
        "Mod+K".focus-workspace-up = true;
        "Mod+L".focus-column-right = true;

        "Mod+WheelScrollLeft".focus-column-left = true;
        "Mod+WheelScrollDown".focus-workspace-down = true;
        "Mod+WheelScrollUp".focus-workspace-up = true;
        "Mod+WheelScrollRight".focus-column-right = true;

        "Mod+Q".spawn = [ "foot" ];
        "Mod+S".spawn = [ "tofi-drun" "--drun-launch=true" ];
        "Mod+Shift+Alt".spawn = [ "bash" "-c" "grim -g \"\$(slurp)\" - | convert - -shave 2x2 PNG:- | wl-copy" ];
      };
    };
    # config = builtins.readFile ./config.kdl;
  };
}