{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;

    xkb = {
      layout = "us,ru";
      options = "grp:lctrl_lwin_toggle";
    };

    excludePackages = with pkgs; [
      xterm
    ];
  };
}