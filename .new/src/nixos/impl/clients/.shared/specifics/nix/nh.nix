{ inputs, config, ... }:

{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 3";
    };
  };

  # environment.sessionVariables.FLAKE = "${config.users.users.lennylizowzskiy.home}/nix-config";
}
