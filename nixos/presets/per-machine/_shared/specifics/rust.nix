{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  environment.systemPackages = with pkgs; [
    pkg-config
    glibc
    openssl
    clang

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
