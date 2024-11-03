{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

# (
#   if (config.local.de == "niri") then
({
  imports = [ inputs.niri-flake.nixosModules.niri ];

  # niri-flake.cache.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    fuzzel
    alacritty
  ];

  # xdg.portal = {
  #   enable = true;

  # config.common.default = "gtk";

  # extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  # };

  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd niri";
        user = "greeter";
      };
      initial_session = default_session;
    };
  };
})
#   else
#     ({ })
# )
