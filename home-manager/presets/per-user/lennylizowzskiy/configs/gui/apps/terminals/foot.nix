{ pkgs, lib, hostname, ... }:

let
  fontSize = (if hostname == "rher" then "6" else "14");
in
{
  home.packages = with pkgs; [ ueberzugpp ];

  programs.foot = {
    enable = true;
    settings = {
      main = {
        dpi-aware = lib.mkForce "yes";
        # term = "xterm-256color";
        font = lib.mkForce "monospace:size=${fontSize}";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      key-bindings = {
        scrollback-up-page = "none";
        scrollback-up-half-page = "none";
        scrollback-up-line = "none";
        scrollback-down-page = "none";
        scrollback-down-half-page = "none";
        scrollback-down-line = "none";
        scrollback-home = "none";
        scrollback-end = "none";
        # clipboard-copy = "none";
        # clipboard-paste = "none";
        primary-paste = "none";
        search-start = "none";
        # font-increase = "none";
        # font-decrease = "none";
        # font-reset = "none";
        spawn-terminal = "none";
        minimize = "none";
        maximize = "none";
        fullscreen = "none";
        # pipe-visible = "none";
        # pipe-scrollback = "none";
        # pipe-selected = "none";
        # pipe-command-output = "[wl-copy] none";
        show-urls-launch = "none";
        show-urls-copy = "none";
        show-urls-persistent = "none";
        prompt-prev = "none";
        prompt-next = "none";
        unicode-input = "none";
        noop = "none";
      };
    };
  };
}
