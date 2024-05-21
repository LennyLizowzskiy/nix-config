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
    # v = "nvim";
    # vi = "nvim";
    # vim = "nvim";
    n = "nvim";
  };

  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    extraLuaPackages =
      ps: with ps; [
        magick
        lua-curl
        nvim-nio
        mimetypes
        xml2lua
      ];
  };

  # programs.git.extraConfig.core.editor = "nvim";

  # xdg.configFile = {
  #   "nvim" = {
  #     source = config.lib.file.mkOutOfStoreSymlink "${nixosArgs.config.nixConfig.flakeRoot}/home-manager/presets/command-line/text-editors/neovim/config";
  #     recursive = true;
  #   };
  # };
}
