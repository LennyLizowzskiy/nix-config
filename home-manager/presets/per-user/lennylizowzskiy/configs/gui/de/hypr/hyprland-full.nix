{ hostname, lib, ... }:

{
  imports = [
    ./hyprland.nix
    ./hyprpaper.nix
    ./pyprland.nix

    ../../wayland/notifications/mako.nix
    ../../wayland/runners/tofi.nix
    ../../wayland/screenshots/swappy.nix
    ../../wayland/statusbars/waybar

    ../../../services/batsignal.nix
    ../../../services/udiskie.nix
    ../../../services/secrets/gnome-keyring.nix
  ] ++ (if (hostname == "rher") then [ ../../../services/applets/blueman.nix ] else [ ]);
}