{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [
      {
        height = 15;
        layer = "top";
        
        modules-left = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "wireplumber"
          "tray"
          "clock"
          "battery"
        ];
      }
    ];

    # style = {
      
    # };
  };
}