{ inputs, externalDir, ... }:

{
  local = {
    hostname = "rher";

    hw.displays = [
      {
        name = "eDP-1";
        resolution = [ 2560 1600 ];
        refreshRate = "60.0";
        scaling = "2";
      }
    ];
  };

  imports =
    [
      ./.hardware.nix
      ../.shared
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
  boot.kernelParams = [
    "mem_sleep_default=deep"
    "pcie_aspm.policy=powersupersave"
  ];

  security.pki.certificateFiles = [
    "${externalDir}/secrets/sog-CAROOT-CA.crt"
    "${externalDir}/secrets/sog-issuer-CA.crt"
  ];
}