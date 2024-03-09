{ pkgs, config, ... }:

{
  home.file.".vim/plugins/telescope-fzf-native-nvim".source = pkgs.vimPlugins.telescope-fzf-native-nvim.out;

  home.packages = with pkgs; [
    neovide
  ];

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

      just
      tree-sitter

      nodePackages.nodejs
      zig
      gcc
      typescript
      rocmPackages.llvm.clang

      taplo
      biome

      prettierd
      nodePackages.prettier-plugin-toml
      markdownlint-cli2
      stylua
      ruff
      shellcheck
      # rustfmt and clippy defined in rust.nix

      vscode-extensions.vadimcn.vscode-lldb.adapter

      slint-lsp
      nodePackages.typescript-language-server
      nixd
      vscode-langservers-extracted
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