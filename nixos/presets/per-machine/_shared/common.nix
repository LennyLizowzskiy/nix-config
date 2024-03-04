{ pkgs, sharedDir, ... }@inputs:

{
  imports = [
    ../../users
    ./specifics/nix.nix
    ./specifics/sudo.nix
  ];

  networking.networkmanager.enable = true;
  networking.nameservers = [
    "8.8.8.8" "8.8.4.4"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.envfs.enable = true;

  # programs.nix-ld.dev.enable = true;

  documentation.man.enable = false;

  environment.systemPackages = with pkgs; [
    
  ] ++ ((import "${sharedDir}/presets/packages/common.nix") pkgs);
}