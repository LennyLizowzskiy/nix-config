{ pkgs, ... }:

{
  services.dbus.packages = with pkgs; [ gnome2.GConf ];
  programs.dconf.enable = true;
}