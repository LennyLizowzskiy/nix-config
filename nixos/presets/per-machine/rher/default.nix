{
  inputs,
  etcDir,
  rootDir,
  extraModules,
  ...
}:

{
  networking.hostName = "rher";

  imports =
    [
      ./.hardware.nix
      ../_shared/desktop.nix
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
    "${etcDir}/external/secrets/sog-CAROOT-CA.crt"
    "${etcDir}/external/secrets/sog-issuer-CA.crt"
  ];
}
