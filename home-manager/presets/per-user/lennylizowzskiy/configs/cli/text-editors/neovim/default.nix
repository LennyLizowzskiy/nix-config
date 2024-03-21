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

  home.packages = with pkgs; [
    neovim
  ];

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    n = "nvim";
  };

  # xdg.configFile = {
  #   "nvim" = {
  #     source = config.lib.file.mkOutOfStoreSymlink "${nixosArgs.config.nixConfig.flakeRoot}/home-manager/presets/command-line/text-editors/neovim/config";
  #     recursive = true;
  #   };
  # };
}