{ pkgs, ... }:

{
  boot.tmp.cleanOnBoot = true;
  boot.kernel.sysctl = { "kernel.unpriviliged_bpf_disabled" = 1; };

  services.yubikey-agent.enable = true;
  programs.yubikey-touch-detector.enable = true;

  services.udev.packages = with pkgs; [
    stable.yubikey-personalization
  ];

  programs.ssh.startAgent = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    gnupg
    stable.yubioath-flutter
    stable.yubikey-manager-qt
    yubico-piv-tool
  ];
}
