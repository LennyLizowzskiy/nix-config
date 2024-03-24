{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      mode = "no-title no-cwd";

      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
