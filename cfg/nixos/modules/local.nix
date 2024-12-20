{
  config,
  lib,
  pkgs,
  ...
}:

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
      shell = mkOption {
        type = types.enum [
          "fish"
          "nu"
        ];
        default = "fish";
      };

      de = mkOption {
        type = types.enum [
          "hyprland"
          "plasma6"
          "niri"
          "sway"
          "jay"
          "cosmic"
        ];
        default = "cosmic";
      };

      terminal = mkOption {
        type = types.enum [
          "alacritty"
          "foot"
          "kitty"
        ];
        default = "foot";
      };

      hostname = mkOption {
        type = types.str;
        default = "nix";
      };

      username = mkOption {
        type = types.str;
        default = "lennylizowzskiy";
      };

      input = {
        keyboard = {
          languages = mkOption {
            type = types.str;
            default = "us,ru";
          };

          layout = mkOption {
            type = types.str;
            default = "grp:toggle";
          };
        };
      };

      hw = {
        displays = mkOption {
          type = types.listOf types.attrs; # .name(str) .resolution(pair of ints) .refreshRate(str) .scaling(str)
          default = [ ];
        };
      };
    };
  };

  config =
    let
      term =
        if cfg.terminal == "foot" then
          pkgs.foot
        else if cfg.terminal == "alacritty" then
          pkgs.alacritty
        else if cfg.terminal == "kitty" then
          pkgs.kitty
        else
          abort "invalid local.terminal";

      termBin =
        if cfg.terminal == "foot" then
          "${pkgs.foot}/bin/foot"
        else if cfg.terminal == "alacritty" then
          lib.getExe pkgs.alacritty
        else if cfg.terminal == "kitty" then
          lib.getExe pkgs.kitty
        else
          abort "invalid local.terminal";
    in
    {
      # Shell
      programs.fish.enable = cfg.shell == "fish";

      users.users.lennylizowzskiy.shell = (
        if cfg.shell == "fish" then
          pkgs.fish
        else if cfg.shell == "nu" then
          pkgs.nushell
        else
          abort "invalid local.shell"
      );

      environment.systemPackages = [
        term
      ];

      # Hostname
      networking.hostName = cfg.hostname;

      # Terminal
      environment.sessionVariables = {
        TERMINAL = termBin;
      };

      environment.shellAliases = {
        terminal = "${termBin}";
      };

      # --- other things are defined in other files ---
    };
}
