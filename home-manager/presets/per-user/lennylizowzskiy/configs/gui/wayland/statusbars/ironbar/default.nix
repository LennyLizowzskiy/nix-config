{ inputs, pkgs, ... }:

{
  imports = [ inputs.ironbar.homeManagerModules.default ];

  programs.ironbar = {
    enable = true;
    style = builtins.readFile ./style.css;

    config = {
      position = "top";
    };
  };
}
