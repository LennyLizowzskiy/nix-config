{
  pkgs,
  inputs,
  ...
}:

{
  local = {
    hostname = "rher";

    hw.displays = [
      {
        name = "eDP-1";
        resolution = [
          2560
          1600
        ];
        refreshRate = 60.0;
        scaling = 2;
      }
    ];
  };

  imports =
    [
      ./.hardware.nix
      ../_shared
    ]
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-hidpi
      common-cpu-amd
      common-cpu-amd-pstate
      common-pc-laptop
      common-pc-ssd
    ]);

  fileSystems."/".options = [
    "noatime"
    "nodiratime"
    "discard"
  ];

  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  boot.kernelParams = [
    "mem_sleep_default=deep"
    # "pcie_aspm.policy=powersupersave"
  ];

  environment.variables = {
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
    rocmPackages.clr.icd
    amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

  services.xserver.videoDrivers = [ "amdgpu" ];
}
