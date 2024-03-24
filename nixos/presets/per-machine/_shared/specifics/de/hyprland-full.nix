{ pkgs, lib, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  xdg.portal = {
    enable = true;

    config.common.default = "hyprland";

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  programs.nm-applet = {
    enable = true;
    indicator = false;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd Hyprland";
        user = "greeter";
      };
      initial_session = default_session;
    };
  };
}