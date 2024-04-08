{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;

    xkb = {
      layout = "us,ru";
      options = "grp:toggle";
    };

    excludePackages = with pkgs; [ xterm ];
  };
}
