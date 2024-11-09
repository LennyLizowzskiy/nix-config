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
    sqlx-cli
    # rust-bindgen-unwrapped
    # tokio-console
    wasm-pack
    crate2nix
    corrosion

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

    ## cargo plugins
    bacon
    cargo-apk
    # cargo-appimage
    # cargo-auditable
    cargo-autoinherit
    cargo-bloat
    cargo-bundle-licenses
    # cargo-cache
    cargo-careful
    cargo-crev
    cargo-chef
    # cargo-clone
    # cargo-codspeed
    # cargo-cross
    # cargo-deb
    cargo-deny
    # cargo-dist
    # cargo-expand
    cargo-features-manager
    # cargo-ft
    # cargo-fuzz
    cargo-generate
    cargo-hack
    # cargo-i18n
    # cargo-info
    # cargo-information
    # cargo-insta
    cargo-license
    cargo-limit
    # cargo-lock
    cargo-make
    cargo-mobile2
    cargo-modules
    cargo-msrv
    cargo-ndk
    cargo-nextest
    cargo-outdated
    cargo-pgo
    cargo-release
    cargo-semver-checks
    # cargo-show-asm
    # cargo-sweep
    # cargo-swift
    # cargo-tarpaulin
    cargo-update
    cargo-wasi
    cargo-watch
    # cargo-whatfeatures
    cargo-wipe
    # cargo-wizard
    cargo-wasi
    cargo-xwin
    # cargo-zigbuild
  ];
}
