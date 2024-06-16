{ pkgs, lib, ... }:

let
  devPath = ".misc/dev/";
  mkDevPluginPaths =
    with lib;
    (plugins: builtins.foldl' (acc: x: acc // { "${devPath}/${x.pname}".source = x; }) { } plugins);
in
{
  home.file = (mkDevPluginPaths (with pkgs; [ mold ])) // {
    "${devPath}/vscode-codelldb-adapter".source =
      pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter.out;
  };

  home.packages = with pkgs; [
    ## supplementary
    git
    gh-dash
    curl
    wget
    unzip
    gnutar
    gzip
    fd
    ripgrep
    ripgrep-all
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
    ## extra package managers
    wasmer
    yarn
    rpm
    dpkg
    pacman

    ## hex editors
    hexcurse
    gnome.ghex

    ## util
    python312Packages.jupytext
    lldb

    ## compilers, linkers & runtimes
    nodePackages.nodejs
    bun
    swc

    python3
    virtualenv
    zig
    gcc
    (lib.lowPrio musl)
    kotlin
    kotlin-native
    detekt
    ktlint
    ktfmt
    mold
    odin
    typescript
    llvmPackages_latest.llvm
    graphviz
    actionlint

    ## lsp & formatters
    buf # proto linter, formatter, templater
    editorconfig-checker
    ktlint
    taplo # toml lsp
    biome # js, ts, jsx linter, formatter & lsp
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
    nodePackages.bash-language-server
    slint-lsp
    nodePackages.typescript-language-server
    nixfmt-rfc-style
    nixd
    vscode-langservers-extracted # html, css, json, eslint lsp
    marksman # md lsp
    lua-language-server
    tailwindcss-language-server
    typst-lsp
    ols # odin lsp
    ruff
    ruff-lsp # py lsp (linter)
    pyright # py lsp (type-checker)
    # pyre # py lsp (type-checker)
    zls # zig lsp
    # rust-analyzer defined in rust.nix
  ];
}
