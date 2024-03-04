{ inputs, config, ... }:

{
  imports = [
    inputs.android-nixpkgs.hmModules.android
  ];

  android-sdk = {
    enable = true;
    path = "${config.home.homeDirectory}/.android/sdk";
    
    packages = sdk: with sdk; [
      build-tools-34-0-0
      cmdline-tools-latest
    ];
  };
}