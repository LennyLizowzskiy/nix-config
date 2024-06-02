{
  pkgs,
  config,
  lib,
  ...
}:

lib.mkIf (config.local.de == "sway") {
  programs.sway = {
    enable = true;
    package = pkgs.swayfx-unwrapped;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export _JAVA_AWT_WM_NONREPARENTING=1
      export ANKI_WAYLAND=1
    '';
  };

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd ${lib.getExe config.programs.sway.package}";
        user = "greeter";
      };
      initial_session = default_session;
    };
  };

  security.polkit.enable = lib.mkForce true;

  programs.nm-applet = {
    enable = true;
    indicator = false;
  };

  qt.enable = true;

  systemd.services.display-manager.serviceConfig.LogNamespace = "graphical-session";
  environment.etc."systemd/journald@graphical-session.conf".text = ''
    [Journal]
    SystemMaxUse=200M
  '';
}
