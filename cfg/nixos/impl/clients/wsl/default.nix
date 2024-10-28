{ inputs, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkg-config
    glibc
    openssl
    clang
    mold

    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];

      targets = [
        "x86_64-unknown-linux-gnu"
        "x86_64-unknown-linux-musl"
        "x86_64-pc-windows-gnu"
        "wasm32-unknown-unknown"
      ];
    })
    bacon
    leptosfmt
    cargo-leptos
    dioxus-cli
    slint-lsp
    cargo-tauri
    trunk
    sqlx-cli
    cargo-generate

    busybox
    zed-editor
    just
    ffmpeg
    wl-clipboard
    wl-clipboard-x11
    steam-run
    p7zip
    peazip
    zip
    unzip
    rar
    unrar
    foot
    onefetch
    xca
    bottom
    eza
    aria
    tealdeer
    brave
    fastfetch
    nixd
  ];

  environment.shellAliases = {
    dl = "aria2c";
    arch = "ouch";
    info = "fastfetch";
    tasks = "btm";
    scan = "rustscan";
    detect = "magika";
    log = "tailspin";

    cat = "bat --style plain";
    ip = "ip --color=auto";
    grep = "rg";

    lsa = "eza --git-ignore --all";
    lsg = "eza --git-ignore --git";
    lss = "eza --git-ignore --tree";
    "." = "eza --all";
    ".." = "cd ..";
    "..." = "cd ../..";
  };

  imports = [
    ../_shared/nix/nix.nix
    ../_shared/nix/nh.nix
    ../_shared/keyring/yubikey.nix
    ../_shared/ui/fonts.nix
    ../_shared/ui/stylix.nix
    ../_shared/ui/wayland-fix.nix
    ../_shared/ui/gtk-fix.nix
    ../_shared/git.nix
    ../_shared/locale.nix

    inputs.nixos-wsl.nixosModules.default
  ];

  local.hostname = "nixwsl";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  wsl = {
    enable = true;

    defaultUser = "lennylizowzskiy";
    startMenuLaunchers = true;
    # usbip.enable = true;
    useWindowsDriver = true;
  };

  programs.nix-ld.enable = true;

  documentation.man.enable = false;

  users.users.lennylizowzskiy = {
    shell = lib.mkForce pkgs.nushell;
    isNormalUser = true;
    createHome = true;
    group = "lennylizowzskiy";
  };
  
  users.groups.lennylizowzskiy = {};

  nix.settings.trusted-users = [
    "lennylizowzskiy"
  ];
}