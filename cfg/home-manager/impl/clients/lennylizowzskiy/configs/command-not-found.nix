{ inputs, ... }:

{
  imports = [ inputs.nix-index-database.hmModules.nix-index ];

  programs.nix-index = {
    enable = true;
  };

  programs.nix-index-database.comma.enable = true;

  programs.command-not-found.enable = false;
}
