{ inputs, sharedDir, ... }:

{
  imports = [ "${sharedDir}/presets/nix.nix" ];

  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;

  system.stateVersion = "23.11";
}
