{ extraArgs, ... }:

{
  imports = [ "${extraArgs.rootDir}/cfg/_shared/nix.nix" ];
}
