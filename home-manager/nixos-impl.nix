{
  inputs,
  pkgs,
  hostname,
  config,
  ...
}@vars:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm-backup";

    extraSpecialArgs = {
      inherit inputs;
      hostname = hostname;
      extraArgs = vars;
    };

    sharedModules = [
      {
        programs.home-manager.enable = true;

        home.stateVersion = "23.11";
      }
    ];

    users = {
      lennylizowzskiy = import ./presets/per-user/lennylizowzskiy;
    };
  };
}
