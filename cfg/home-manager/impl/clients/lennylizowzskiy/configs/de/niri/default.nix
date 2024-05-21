{
  pkgs,
  lib,
  mainConfig,
  ...
}:

if (mainConfig.local.de == "niri") then {
  imports = [
    # inputs.niri-flake.homeModules.config

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
    config =
      let
        cfgTxt =
          "";
      in
        "${cfgTxt}\n${(builtins.readFile ./config.kdl)}";
  };
} else {}