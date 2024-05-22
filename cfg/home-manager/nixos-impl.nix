{ inputs, config, ... }@vars:

{
  # imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm-backup";

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
