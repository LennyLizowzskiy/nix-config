{ pkgs, lib, config, ... }:

let
  vimResPath = ".vim";
  mkVimPluginPaths = with lib; (plugins:
    builtins.foldl' (acc: x: acc // { "${vimResPath}/plugins/${x.pname}".source = x; }) {} plugins
  );
in
{
  home.file = (mkVimPluginPaths (with pkgs.vimPlugins; [
    
  ])) // {
    "${vimResPath}/etc/vscode-codelldb".source = pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter.out;
  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
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

      nodePackages.nodejs
      yarn
      
      zig
      gcc
      typescript
      rocmPackages.llvm.clang

      taplo
      biome
      html-tidy

      prettierd
      nodePackages.prettier-plugin-toml
      markdownlint-cli2
      stylua
      ruff
      shellcheck
      # rustfmt and clippy defined in rust.nix

      slint-lsp
      nodePackages.typescript-language-server
      nixd
      vscode-langservers-extracted
      marksman
      lua-language-server
      tailwindcss-language-server
      typst-lsp
      ruff
      zls
      # rust-analyzer defined in rust.nix
    ];
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  # xdg.configFile = {
  #   "nvim" = {
  #     source = config.lib.file.mkOutOfStoreSymlink "${nixosArgs.config.nixConfig.flakeRoot}/home-manager/presets/command-line/text-editors/neovim/config";
  #     recursive = true;
  #   };
  # };
}