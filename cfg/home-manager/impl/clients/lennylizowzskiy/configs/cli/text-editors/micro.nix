{ pkgs, ... }:

{
  programs.micro = {
    enable = true;

    settings = {
      autosu = true;
      basename = true;
      clipboard = "external";
      mkparents = true;
      saveundo = true;
      smartpaste = false;
      softwrap = true;
      tabstospaces = true;
      wordwrap = true;
    };
  };
}
