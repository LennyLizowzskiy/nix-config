{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    just
    dua # disk storage usage util
    duf # disk storage usage util
    fd # find-like
    sd # sed-like
    fdupes # find duplicates
    screen
    # nix-init
    ffmpeg
    imagemagickBig
    busybox
    steam-run
    aria
    ouch
    btop
    eza
    sd
    sops
    unzip
    zip
    archiver
    archivemount

    wl-clipboard
    wl-clipboard-x11

    steam-run # FHS env on demand

    git-open
    genymotion
    slides
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
    atool # compact
    trash-cli # trash
    lame # convert music
    sshfs
    bubblewrap # isolation
    resources # gui task manager
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
    # nix-alien
  ];
}