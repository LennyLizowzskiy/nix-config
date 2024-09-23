{ pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita-dark";
    };
  };

  stylix = {
    # enable = true;
    autoEnable = false;

    targets = {
      bat.enable = true;
      btop.enable = true;
      foot.enable = true;
      fzf.enable = true;
      gitui.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      k9s.enable = true;
      kde.enable = true;
      lazygit.enable = true;
      vesktop.enable = true;
      waybar.enable = true;
    
      kitty.enable = true;
      kitty.variant256Colors = true;
    };
  };
}
