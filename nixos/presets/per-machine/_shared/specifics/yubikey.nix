{ pkgs, ... }:

{
  # services.yubikey-agent.enable = true;
  programs.yubikey-touch-detector.enable = true;

  services.udev.packages = with pkgs; [ stable.yubikey-personalization ];

  environment.systemPackages = with pkgs; [
    stable.yubioath-flutter
    stable.yubikey-manager
    stable.yubikey-manager-qt
    stable.yubico-piv-tool
  ];
}
