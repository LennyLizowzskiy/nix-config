{
  pkgs,
  lib,
  rootDir,
  inputs,
  ...
}:

{
  imports = [
    "${rootDir}/cfg/nixos"
    inputs.nixos-cosmic.nixosModules.default

    ./keyring/gnome-keyring.nix
    ./keyring/keys.nix
    ./keyring/yubikey.nix
    ./nix/nh.nix
    ./nix/nix-alien.nix
    ./nix/nix.nix
    ./proxy/shadowsocks.nix
    ./ui/fonts.nix
    ./ui/graphics.nix
    ./ui/gtk-fix.nix
    ./ui/stylix.nix
    ./ui/wayland-fix.nix
    ./de/hyprland-full.nix
    ./de/niri-full.nix
    ./de/plasma6.nix
    ./de/sway-full.nix
    ./de/jay-full.nix
    ./de/cosmic.nix
    ./bluetooth.nix
    ./distrobox.nix
    ./fine-tuning.nix
    ./proxy.nix
    ./gamemode.nix
    ./git.nix
    ./hardened.nix
    ./locale.nix
    ./packages.nix
    ./pipewire.nix
    ./qemu.nix
    ./qmk.nix
    ./steam.nix
    ./sudo.nix
    ./waydroid.nix
    ./wireshark.nix
    ./xserver.nix
  ];

  users.users = {
    lennylizowzskiy = {
      isNormalUser = true;
      createHome = true;
      # shell = pkgs.nushellFull;
      # shell = pkgs.fish;

      initialHashedPassword = "$y$j9T$oJX8GijWaFwGIoyMQozuI0$IFMHCAQXsZIRLcRdFsifIT3ZJHuz9NcYHhHXPLA4cCA";

      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "audio"
        "video"
        "adbusers"
        "gamemode"
        "docker"
        "wireshark"
      ];
    };
  };

  services.gvfs.enable = true;

  services.upower = {
    enable = true;

    percentageLow = 25;
    percentageCritical = 10;
    percentageAction = 5;
  };

  networking = {
    networkmanager.enable = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    firewall.enable = false;
    resolvconf.dnsExtensionMechanism = false;
  };

  services.envfs.enable = true; # "A fuse filesystem that dynamically populates contents of /bin and /usr/bin/ so that it contains all executables from the PATH of the requesting process"
  # programs.nix-ld.dev.enable = true;
  documentation.man.enable = false;
  programs.command-not-found.enable = false;
  services.flatpak.enable = true;
  services.printing.enable = true;
  programs.adb.enable = true;
  programs.nano.enable = false;
  services.dbus.implementation = "broker";
  services.journald.extraConfig = "SystemMaxUse=200M";
  systemd.coredump.extraConfig = "MaxUse=200M";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  xdg.portal = {
    enable = lib.mkDefault true;
    xdgOpenUsePortal = true;
  };

  zramSwap = {
    enable = true;
    priority = 1000;
    algorithm = "zstd";
    swapDevices = 1;
    memoryPercent = 50;
  };

  # "daemon, tools and libraries to access and manipulate disks, storage devices and technologies"
  services.udisks2.enable = true;
}
