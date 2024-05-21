{ extraArgs, ... }:

{
  imports = [ "${extraArgs.rootDir}/cfg/.shared/nix.nix" ];
}
