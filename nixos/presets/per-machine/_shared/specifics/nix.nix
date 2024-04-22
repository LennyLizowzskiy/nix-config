{ inputs, pkgs, sharedDir, ... }:

{
  imports = [ "${sharedDir}/presets/nix.nix" ];

  environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  nix.settings.system-features = [ "recursive-nix" ];

  system.stateVersion = "23.11";
  
  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];

  system.activationScripts.diff = ''
    if [[ -e /run/current-system ]]; then
      echo -e "\n***            ***          ***           ***           ***\n"
      ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig" | grep -w "→" | grep -w "KiB" | column --table --separator " ,:" | ${pkgs.choose}/bin/choose 0:1 -4:-1 | ${pkgs.gawk}/bin/awk '{s=$0; gsub(/\033\[[ -?]*[@-~]/,"",s); print s "\t" $0}' | sort -k5,5gr | ${pkgs.choose}/bin/choose 6:-1 | column --table
      echo -e "\n***            ***          ***           ***           ***\n"
    fi
  '';
}
