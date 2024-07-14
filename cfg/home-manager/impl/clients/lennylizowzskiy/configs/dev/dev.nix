{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ## supplementary
    git
    k9s
    commitlint-rs
    typst
    typst-live
    gh-dash
    curl
    wget
    unzip
    gnutar
    gzip
    fd
    ripgrep
    ripgrep-all
    ast-grep
    fzf
    gnumake
    cmake
    jq
    yq
    jaq
    curl
    just
    tree-sitter
    flatpak-builder
    hyperfine
    gitleaks
    trippy
    bugstalker
    slumber
    tabiew
    rust-bindgen
    rust-cbindgen

    ## extra package managers
    wasmer
    yarn
    rpm
    dpkg
    pacman

    ## hex editors & decompilers
    radare2
    iaito
    ghidra-bin
    frida-tools
    ghex

    ## util
    python312Packages.jupytext
    lldb
    delve

    ## compilers, linkers & runtimes
    nodePackages.nodejs
    bun
    swc
    go
    # gccgo
    python3
    virtualenv
    zig
    gcc
    (lib.lowPrio musl)
    # kotlin
    # kotlin-native
    # detekt
    # ktlint
    # ktfmt
    mold
    odin
    typescript
    llvmPackages_latest.llvm
    graphviz
    actionlint

    ## lsp & formatters
    typos
    typos-lsp
    typstyle
    buf # proto linter, formatter, templater
    editorconfig-checker
    ktlint
    taplo # toml lsp
    biome # js, ts, jsx linter, formatter & lsp
    gopls
    golangci-lint
    golangci-lint-langserver
    neocmakelsp
    asm-lsp
    html-tidy # html validator
    prettierd
    nodePackages.prettier-plugin-toml
    markdownlint-cli2
    stylua
    ruff # py linter & formatter
    shellcheck
    nodePackages.graphql-language-service-cli
    docker-compose-language-service
    dockerfile-language-server-nodejs
    clang-tools # c, c++, objc, cuda, proto lsp
    # rustfmt and clippy defined in rust.nix
    yaml-language-server
    bash-language-server
    dot-language-server
    slint-lsp
    nodePackages.typescript-language-server
    nixfmt-rfc-style
    nixd
    vscode-langservers-extracted # html, css, json, eslint lsp
    marksman # md lsp
    lua-language-server
    tailwindcss-language-server
    tinymist
    ols # odin lsp
    ruff
    ruff-lsp # py lsp (linter)
    basedpyright # py lsp (type-checker)
    # pyre # py lsp (type-checker)
    zls # zig lsp
    # rust-analyzer defined in rust.nix
  ];
}
