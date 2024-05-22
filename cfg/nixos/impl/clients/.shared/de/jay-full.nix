{ pkgs, lib, config, ... }:

lib.mkIf (config.local.de == "jay") {
  environment.systemPackages = with pkgs; [
    jay
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  programs.nm-applet = {
    enable = true;
    indicator = false;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd ${lib.getExe pkgs.jay}";
        user = "greeter";
      };
      initial_session = default_session;
    };
  };
}