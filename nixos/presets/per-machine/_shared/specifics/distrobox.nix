{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    distrobox
    apx
  ];

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
