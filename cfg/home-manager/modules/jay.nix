{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.wayland.windowManager.jay;

  tomlFormatter = pkgs.formats.toml { };
in
{
  options = {
    wayland.windowManager.jay = {
      enable = mkEnableOption "Jay - a window manager";

      settings = mkOption {
        # toml
        type = types.attrs;
        default = { };
      };

      extraConfig = mkOption {
        type = types.str;
        default = "";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ jay ];

    xdg.configFile = {
      "jay/config.toml".text = "${builtins.readFile (tomlFormatter.generate "jay_config.toml" cfg.settings)}\n\n${cfg.extraConfig}";
    };
  };
}
