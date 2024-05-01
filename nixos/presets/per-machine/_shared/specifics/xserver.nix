{ pkgs, ... }:

{
  services.libinput.enable = true;

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us,ru";
      options = "grp:toggle";
    };

    excludePackages = with pkgs; [ xterm ];
  };
}