{ pkgs, ... }:

{
  environment.shellAliases = {
    dl = "aria2c";
    arch = "ouch";
    info = "fastfetch";
    tasks = "btm";
    scan = "rustscan";
    detect = "magika";
    log = "tailspin";

    cat = "bat --style plain";
    nano = "micro";
    ip = "ip --color=auto";
    grep = "rg";
    dig = "doggo";
    sysctl = "systeroid";

    lsa = "eza --all";
    lsg = "eza --git";
    lss = "eza --tree";
    "." = "eza -a";
    ".." = "cd ..";
    "..." = "cd ../..";
  };

  environment.systemPackages = with pkgs; [
    just
    dust # du alt
    dua # du alt
    duf # df alt
    fd # find-like
    sd # sed-like
    fdupes # find duplicates
    ffmpeg
    imagemagickBig
    await
    ripgrep
    httpie
    curlie
    ripgrep-all
    rustscan
    # magika
    tailspin
    systeroid
    fselect
    floorp-unwrapped
    # busybox
    toybox
    steam-run
    aria
    ouch
    eza
    sd
    sops
    bottom
    tealdeer

    wl-clipboard
    wl-clipboard-x11

    steam-run # FHS env on demand

    genymotion
    slides
    hoppscotch
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
