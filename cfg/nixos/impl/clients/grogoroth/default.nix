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
      ../_shared
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

  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  boot.initrd.kernelModules = [ "amdgpu" ];

  environment.variables = {
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
    rocmPackages.clr.icd
    amdvlk
  ];

  hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

  services.xserver.videoDrivers = [ "amdgpu" ];
}
