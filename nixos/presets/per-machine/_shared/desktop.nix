{
  pkgs,
  rootDir,
  lib,
  sharedDir,
  ...
}:

{
  imports = [
    ./common.nix
    ./specifics/distrobox.nix
    # ./specifics/fonts.nix
    ./specifics/stylix.nix
    ./specifics/gamemode.nix
    ./specifics/git.nix
    ./specifics/graphics.nix
    ./specifics/gtk-fix.nix
    ./specifics/locale.nix
    ./specifics/nix.nix
    ./specifics/pipewire.nix
    ./specifics/sudo.nix
    ./specifics/waydroid.nix
    ./specifics/wireshark.nix
    ./specifics/xserver.nix
    ./specifics/yubikey.nix
    ./specifics/steam.nix
    ./specifics/shadowsocks.nix
    ./specifics/ssh.nix

    # ./specifics/gnome-keyring.nix # in home-manager
    ./specifics/de/hyprland-full.nix
    # ./specifics/de/plasma5.nix
    # ./specifics/de/plasma6.nix

    "${rootDir}/home-manager/nixos-impl.nix"
  ];

  environment.systemPackages =
    with pkgs;
    [
      wl-clipboard
      wl-clipboard-x11

      steam-run # FHS env on demand

      genymotion
      httpie
      youtube-music
      p7zip
      rar
      unrar
      zip
      unzip
      archiver
      brave
      firefox
      prismlauncher
      masterpdfeditor
      partition-manager
      haruna
      microsoft-edge
      telegram-desktop
      audacity
      figma-linux
      vesktop
      figma-linux
      gimp
      inkscape-with-extensions
      nicotine-plus
      onlyoffice-bin
      scrcpy
      xca
      tealdeer
      gnome.gnome-font-viewer
      ripdrag
      v2raya
      fractal
    ];

  programs.command-not-found.enable = false;
  services.flatpak.enable = true;
  services.printing.enable = true;
  programs.adb.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    extraModulePackages = with pkgs.linuxKernel.packages.linux_zen; [
      # xpadneo
      # xone
    ];
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  # "A fuse filesystem that dynamically populates contents of /bin and /usr/bin/ so that it contains all executables from the PATH of the requesting process"
  zramSwap.enable = true;

  # "daemon, tools and libraries to access and manipulate disks, storage devices and technologies"
  services.udisks2.enable = true;
}
