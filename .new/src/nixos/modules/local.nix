{ config, lib, pkgs, ... }:

#
# NixOS module
# uses NixOS modules and home-manager modules
#

with lib;

let
  cfg = config.local;
in
{
  options = {
    local = {
      shell = {
        type = types.enum [
          "fish" "nu"
        ];
        default = "fish";
      };

      de = {
        type = types.enum [
          "hyprland" "plasma6" "niri" "sway"
        ];
        default = "plasma6";
      };

      terminal = {
        type = types.enum [
          "alacritty" "foot"
        ];
        default = "foot";
      };

      hostname = {
        type = types.str;
        default = "nix";
      };

      username = {
        type = types.str;
        default = "lennylizowzskiy";
      };

      input = {
        keyboard = {
          languages = {
            type = types.str;
            default = "us,ru";
          };

          layout = {
            type = types.str;
            default = "grp:toggle";
          };
        };
      };

      hw = {
        displays = {
          type = types.listOf types.attrs; # .name .resolution .refreshRate .scaling
          default = [ ];
        };
      };
    };
  };

  config = {
    # Shell
    programs.fish.enable = cfg.shell == "fish";

    users.users.lennylizowzskiy.shell = (
      if cfg.shell == "fish" then
        pkgs.fish
      else if cfg.shell == "nu" then
        pkgs.nushellFull
      else
        abort "invalid local.shell"
    );

    # --- other things are defined in other files ---
  };
}