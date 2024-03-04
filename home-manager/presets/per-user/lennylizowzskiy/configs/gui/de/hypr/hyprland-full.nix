{ ... }:

{
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./pyprland.nix

    ../../wayland/notifications/mako.nix
    ../../wayland/runners/tofi.nix
    ../../wayland/screenshots/swappy.nix
    ../../wayland/statusbars/wayland.nix

    ../../../services/batsignal.nix
    ../../../services/udiskie.nix
    ../../../services/blueman.nix
  ];
}