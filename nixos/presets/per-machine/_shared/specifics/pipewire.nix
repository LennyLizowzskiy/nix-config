{
  pkgs,
  lib,
  stdenv,
  ...
}:

let
  writeWpPlugin =
    path: content:
    let
      niceName = builtins.replaceStrings [ "/" ] [ "-" ] path;
    in
    pkgs.writeTextFile {
      name = "wireplumber_plugin_${niceName}";
      text = content;
      destination = "/share/wireplumber/${path}";
    };
in
{
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

    wireplumber = {
      enable = true;

      configPackages = [
        (writeWpPlugin "bluetooth.lua.d/51-bluez-config.lua" ''
          bluez_monitor.properties = {
            ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
        '')
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    easyeffects
    pavucontrol
  ];
}
