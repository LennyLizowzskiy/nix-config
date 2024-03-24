{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  networking.hostName = "grogoroth";

  imports =
    [
      ./.hardware.nix
      ../_shared/desktop.nix
    ]
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-amd
      common-cpu-amd-pstate
      common-pc
      common-pc-ssd
    ]);

  fileSystems."/".options = [
    "noatime"
    "nodiratime"
    "discard"
  ];
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];
  hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
}
