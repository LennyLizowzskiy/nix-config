{
  inputs,
  pkgs,
  etcDir,
  ...
}:

{
  stylix = {
    autoEnable = true;

    targets = {
      vim.enable = false;
      nixvim.enable = false;
      vscode.enable = false;
      firefox.enable = false;
      kde.enable = false;
    };
  };
}
