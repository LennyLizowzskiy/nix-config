{
  inputs,
  pkgs,
  etcDir,
  ...
}:

{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita-dark";
    };
  };

  stylix = {
    autoEnable = true;

    targets = {
      vim.enable = false;
      nixvim.enable = false;
      vscode.enable = false;
      firefox.enable = false;
      waybar.enable = false;
    };
  };
}
