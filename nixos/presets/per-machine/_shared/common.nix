{
  pkgs,
  lib,
  sharedDir,
  ...
}@inputs:

{
  imports = [
    ../../users
    ./specifics/nix.nix
    ./specifics/sudo.nix
  ];

  networking.networkmanager.enable = true;
  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.envfs.enable = true;

  # programs.nix-ld.dev.enable = true;

  documentation.man.enable = false;

  # programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-all;

  environment.systemPackages = with pkgs; [
    just
    dua # disk storage usage util
    duf # disk storage usage util
    fd # find-like
    sd # sed-like
    fdupes # find duplicates
    screen
    nix-init
    ffmpeg
    imagemagickBig
    busybox
    steam-run
    aria
    btop
    eza
    sops
    unzip
    zip
    archiver
    archivemount
  ];
}