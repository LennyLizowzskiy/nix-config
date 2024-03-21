{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  home.packages = with pkgs; [
    pkg-config
    glibc
    openssl
    clang
    mold

    leptosfmt
    cargo-leptos

    slint-lsp

    (rust-bin.stable.latest.default.override {
      extensions = [
        "rustc"
        "cargo"
        "rust-std"
        "rust-docs"
        "rust-analyzer"
        "clippy"
        "rustfmt"
#         "miri"
        "rust-src"
      ];
    })
  ];
}