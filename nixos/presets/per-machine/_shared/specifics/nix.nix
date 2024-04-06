{ inputs, sharedDir, ... }:

{
  imports = [ "${sharedDir}/presets/nix.nix" ];

  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  nix.settings.system-features = [ "recursive-nix" ];

  system.stateVersion = "23.11";
}
