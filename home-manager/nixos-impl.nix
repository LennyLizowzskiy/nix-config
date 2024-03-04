{ inputs, pkgs, config, ... }@vars:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      extraArgs = vars;
    };

    users = {
      lennylizowzskiy = import ./presets/per-user/lennylizowzskiy;
    };
  };
}