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
    ./specifics/keys.nix
    ./specifics/nix-alien.nix
    ./specifics/hardened.nix
    ./specifics/nh.nix
    ./specifics/qmk.nix

    ./specifics/gnome-keyring.nix
    ./specifics/de/hyprland-full.nix
    # ./specifics/de/niri-full.nix
    # ./specifics/de/plasma5.nix
    # ./specifics/de/plasma6.nix

    "${rootDir}/home-manager/nixos-impl.nix"
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wl-clipboard-x11

    steam-run # FHS env on demand

    git-open
    genymotion
    # httpie
    hoppscotch
    git-extras
    youtube-music
    p7zip
    rar
    unrar
    zip
    unzip
    archiver
    brave
    opera
    firefox
    prismlauncher
    masterpdfeditor
    microsoft-edge
    telegram-desktop
    audacity
    figma-linux
    warp-terminal
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
    atool
    trash-cli
    lame
    sshfs
    bubblewrap
    resources
    mpv # vid
    celluloid # vid
    amberol # music
    gparted # disk
    thunderbird-bin
    fractal
    kdePackages.dolphin
    popsicle # usb flasher
    onefetch # git info fetcher
    gping
    asciinema
    grex
    nix-alien
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

  systemd.services.NetworkManager-wait-online.enable = false;

  # "A fuse filesystem that dynamically populates contents of /bin and /usr/bin/ so that it contains all executables from the PATH of the requesting process"
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
