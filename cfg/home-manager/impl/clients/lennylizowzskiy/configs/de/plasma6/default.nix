{ inputs, mainConfig, ... }:

if (mainConfig.local.de == "jay") then
{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  programs.plasma = {
    # enable = true;
  };
}
else
  { }