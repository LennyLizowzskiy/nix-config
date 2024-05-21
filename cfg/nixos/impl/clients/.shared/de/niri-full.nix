{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

lib.mkIf (config.local.de == "niri") {
  # imports = [ inputs.niri-flake.nixosModules.niri ];

  # niri-flake.cache.enable = false;

  # programs.niri = {
  #   enable = true;
  # };

  # xdg.portal = {
  #   enable = true;

  #   # config.common.default = "gtk";

  #   extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  # };

  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     default_session = {
  #       command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd niri";
  #       user = "greeter";
  #     };
  #     initial_session = default_session;
  #   };
  # };
}
