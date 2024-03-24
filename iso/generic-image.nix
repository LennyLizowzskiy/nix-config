{
  pkgs,
  modulesPath,
  inputs,
  ...
}:

{
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];

  nixpkgs.hostPlatform = "x86_64-linux";

  environment.systemPackages = with pkgs; [
    git
    parted
    neovim
    micro
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "repl-flake"
  ];

  environment.etc."nixos-config".source = inputs.rootDir;
}
