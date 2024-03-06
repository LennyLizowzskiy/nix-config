{ inputs, sharedDir, ... }:

{
  imports = [
    (import "${sharedDir}/presets/stylix.nix" inputs.stylix.homeManagerModules.stylix)
  ];
}
