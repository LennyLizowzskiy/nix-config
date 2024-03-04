{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkg-config
    glibc
    openssl

    rustup-toolchain-install-master
  ];
}