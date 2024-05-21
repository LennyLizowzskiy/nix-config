{ pkgs, inputs, ... }:

{
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
    dioxus-cli
    slint-lsp
    cargo-tauri
    trunk

    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];

      targets = [
        "x86_64-pc-windows-gnu"
        "wasm32-unknown-unknown"
      ];
    })

    ## cargo plugins
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
    cargo-pgo
    cargo-apk
    cargo-wipe
    cargo-wasi
    cargo-msrv
    cargo-lock
    cargo-info
    cargo-i18n
    cargo-hack
    cargo-fuzz
    cargo-dist
    cargo-sweep
    cargo-limit
    cargo-insta
    cargo-cross
    cargo-clone
    cargo-bloat
    cargo-release
    cargo-nextest
    cargo-modules
    cargo-mobile2
    cargo-license
    cargo-show-asm
    cargo-outdated
    cargo-generate
    cargo-codspeed
    cargo-tarpaulin
    cargo-auditable
    # cargo-information
    cargo-autoinherit
    cargo-whatfeatures
    cargo-semver-checks
    cargo-bundle-licenses
    # cargo-appimage
    # cargo-ft
  ];
}
