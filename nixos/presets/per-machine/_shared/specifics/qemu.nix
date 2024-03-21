{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libguestfs
    virt-manager
  ];

  virtualisation.libvirtd = {
    enable = true;
  };
}