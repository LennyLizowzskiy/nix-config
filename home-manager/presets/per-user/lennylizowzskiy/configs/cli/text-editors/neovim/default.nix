{ pkgs, config, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      git
      curl
      wget
      unzip
      gnutar
      gzip
      
      nodePackages_latest.prettier
      stylua
      just
      rustfmt
      shfmt
      yamlfmt
      lua54Packages.luacheck
      nixd
      rust-analyzer
      jdt-language-server
      luajitPackages.lua-lsp
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