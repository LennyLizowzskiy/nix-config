{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.wayland.windowManager.jay;

  tomlFormatter = pkgs.formats.toml {};
in
{
  config = {
    wayland.windowManager.jay = {
      enable = mkEnableOption "Jay - a window manager";

      settings = { # toml
        type = types.attrs;
        default = {};
      };

      extraConfig = {
        type = types.str;
        default = "";
      };
    };
  };

  options = mkIf cfg.enable {
    home.packages = with pkgs; [
      jay
    ];

    xdg.configFile = {
      "jay/config.toml".source = "${tomlFormatter.generate "jay_config.toml" cfg.settings}\n${cfg.extraConfig}";
    };
  };
}