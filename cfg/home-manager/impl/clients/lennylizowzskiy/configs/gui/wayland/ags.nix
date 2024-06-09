{ inputs, pkgs, ... }:

{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      libdbusmenu-gtk3
      gnome.gnome-bluetooth
      brightnessctl
    ];
  };
}
