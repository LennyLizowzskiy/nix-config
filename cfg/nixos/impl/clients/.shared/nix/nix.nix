{
  inputs,
  pkgs,
  rootDir,
  lib,
  ...
}:

{
  imports = [ "${rootDir}/cfg/.shared/nix.nix" ];

  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  nix.settings.system-features = [ "recursive-nix" ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  system.stateVersion = lib.trivial.release;

  environment.systemPackages = with pkgs; [ nix-output-monitor ];

  system.activationScripts.diff = ''
    if [[ -e /run/current-system ]]; then
      echo -e "\n***            ***          ***           ***           ***\n"
      ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig" | grep -w "→" | grep -w "KiB" | column --table --separator " ,:" | ${pkgs.choose}/bin/choose 0:1 -4:-1 | ${pkgs.gawk}/bin/awk '{s=$0; gsub(/\033\[[ -?]*[@-~]/,"",s); print s "\t" $0}' | sort -k5,5gr | ${pkgs.choose}/bin/choose 6:-1 | column --table
      echo -e "\n***            ***          ***           ***           ***\n"
    fi
  '';
}
