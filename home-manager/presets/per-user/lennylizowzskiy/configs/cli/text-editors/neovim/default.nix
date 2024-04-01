{
  pkgs,
  lib,
  config,
  ...
}:

# let
#vimResPath = ".vim";
#mkVimPluginPaths = with lib; (plugins:
#  builtins.foldl' (acc: x: acc // { "${vimResPath}/plugins/${x.pname}".source = x; }) {} plugins
#);
# in
{
  # home.packages = with pkgs; [ neovim-nightly ];

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    n = "nvim";
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraLuaPackages = ps: [ ps.magick ];
  };

  # xdg.configFile = {
  #   "nvim" = {
  #     source = config.lib.file.mkOutOfStoreSymlink "${nixosArgs.config.nixConfig.flakeRoot}/home-manager/presets/command-line/text-editors/neovim/config";
  #     recursive = true;
  #   };
  # };
}