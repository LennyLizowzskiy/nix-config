{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## supplementary
    git
    curl
    wget
    unzip
    gnutar
    gzip
    fd
    ripgrep
    fzf
    gnumake
    cmake
    jq
    jaq
    curl
    just
    tree-sitter

    ## extra package managers
    wasmer
    yarn

    ## compilers & runtimes
    nodePackages.nodejs
    python3
    zig
    gcc
    odin
    typescript
    llvmPackages_latest.llvm

    ## lsp & formatters
    taplo # toml lsp
    biome # js, ts, jsx linter, formatter & lsp
    html-tidy # html validator
    prettierd
    nodePackages.prettier-plugin-toml
    markdownlint-cli2
    stylua
    ruff # py linter & formatter
    shellcheck
    # rustfmt and clippy defined in rust.nix
    slint-lsp
    nodePackages.typescript-language-server
    nixd
    vscode-langservers-extracted # html, css, json, eslint lsp
    marksman # md lsp
    lua-language-server
    tailwindcss-language-server
    typst-lsp
    ols # odin lsp
    ruff-lsp # py lsp (linter)
    nodePackages.pyright # py lsp (type-checker)
    # pyre # py lsp (type-checker)
    zls # zig lsp
    # rust-analyzer defined in rust.nix
    ];
}