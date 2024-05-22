{ pkgs, inputs, ... }:

{
  local = {
    hostname = "grogoroth";

    hw.displays = [
      {
        name = "DP-2";
        resolution = [
          2560
          1440
        ];
        refreshRate = 142.001;
        scaling = 1;
      }
    ];
  };

  imports =
    [
      ./.hardware.nix
      ../.shared
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
