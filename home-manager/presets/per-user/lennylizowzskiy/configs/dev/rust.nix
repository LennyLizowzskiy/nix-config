{ pkgs, inputs, ... }:

{
  # nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  home.

  home.packages = with pkgs; [
    ## basic build dependencies
    pkg-config
    glibc
    openssl
    clang
    mold # efficient linker

    ## misc for Rust-specific stuff
    leptosfmt
    cargo-leptos
    slint-lsp

    rustc
    cargo
    rustup
    clippy

    ## cargo additions
    cargo-expand
    cargo-deb
    cargo-ndk
    cargo-watch
    cargo-make
    cargo-deny
    cargo-chef
    bacon
    cargo-release
    cargo-zigbuild
    cargo-outdated
    cargo-update
    cargo-semver-checks
    cargo-cache
    cargo-about
    cargo-wizard
    cargo-xwin
    cargo-appimage
    cargo-ft

#     (rust-bin.stable.latest.default.override {
#       extensions = [
#         "rustc"
#         "cargo"
#         "rust-std"
#         "rust-docs"
#         "rust-analyzer"
#         "clippy"
#         "rustfmt"
# #         "miri"
#         "rust-src"
#       ];
#     })
  ];
}