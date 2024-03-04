{ pkgs, ... }:

{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  # hardware.pulseaudio.enable = true;

  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
}