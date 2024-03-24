{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;

    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };

    excludePackages = with pkgs; [ xterm ];
  };
}
