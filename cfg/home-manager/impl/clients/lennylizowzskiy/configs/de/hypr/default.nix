{
  pkgs,
  lib,
  mainConfig,
  ...
}:

if (mainConfig.local.de == "hyprland") then
  {
    home.packages = with pkgs; [
      upower
      ironbar
    ];

    imports =
      [
        ./hyprland.nix
        ./hyprpaper.nix
        ./pyprland.nix

        # ../../gui/wayland/notifications/mako.nix
        ../../gui/wayland/runners/tofi.nix
        ../../gui/wayland/screenshots/swappy.nix
        # ../../wayland/statusbars/waybar
        # ../../wayland/statusbars/ironbar
        ../../gui/wayland/ags.nix
        ../../services/batsignal.nix
        ../../services/udiskie.nix
        ../../services/secrets/gnome-keyring.nix
      ]
      ++ (if (mainConfig.local.hostname == "rher") then [ ../../services/applets/blueman.nix ] else [ ]);
  }
else
  { }
