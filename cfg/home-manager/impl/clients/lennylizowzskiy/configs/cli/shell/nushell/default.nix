{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;

    # configFile.source = ./config.nu;
    # envFile.source = ./env.nu;
  };
}
