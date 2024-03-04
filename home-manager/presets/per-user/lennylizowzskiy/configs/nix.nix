{ inputs, extraArgs, ... }:

{
  imports = [
    "${extraArgs.sharedDir}/presets/nix.nix"
  ];
}