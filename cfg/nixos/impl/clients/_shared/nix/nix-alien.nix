{ pkgs, ... }:

{
  # environment.systemPackages = with pkgs; [ nix-alien ];

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      glib
      curl
      fontconfig
      freetype
      libgit2
      openssl
      sqlite
      zlib
      zstd
      alsa-lib
      libxkbcommon
      wayland
      xorg.libxcb
      rdma-core
      stdenv.cc.cc
      taglib
      openssl
      attr
      libssh
      libsodium
      util-linux
      systemd
    ];
  };
}
