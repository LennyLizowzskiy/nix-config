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
}
