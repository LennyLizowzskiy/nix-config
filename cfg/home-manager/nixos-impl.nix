{ inputs, config, pkgs, ... }@vars:

{
  # imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    # backupFileExtension = "hm-back";
    backupFileExtension = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";

    extraSpecialArgs = {
      inherit inputs;
      extraArgs = vars;
      mainConfig = config;
    };

    sharedModules = [
      {
        programs.home-manager.enable = true;

        home.stateVersion = "23.11";
      }
    ];

    users = {
      lennylizowzskiy = import ./impl/clients/lennylizowzskiy;
    };
  };
}
