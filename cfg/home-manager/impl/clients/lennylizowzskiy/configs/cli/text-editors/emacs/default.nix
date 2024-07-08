{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    # package = pkgs.emacs29-pgtk;
    socketActivation.enable = true;

    client = {
      enable = true;
    };
  };
}
