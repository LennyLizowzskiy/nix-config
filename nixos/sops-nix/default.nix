{ inputs, pkgs, config, etcDir, ... }:

{
  # imports = [
  #   inputs.sops-nix.nixosModules.sops
  # ];

  # environment.systemPackages = with pkgs; [
  #   sops
  # ];

  # sops = {
  #   gnupg.home = "${config.users.users.lennylizowzskiy.home}/.gnupg";

  #   defaultSopsFile = ./secrets/main.yaml;
  #   defaultSopsFormat = "yaml";

  #   secrets = {
  #     "test" = {
        
  #     };
  #   };
  # };
}