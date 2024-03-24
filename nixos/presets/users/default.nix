{ pkgs, ... }:

{
  users.users = {
    lennylizowzskiy = {
      isNormalUser = true;
      createHome = true;
      # ignoreShellProgramCheck = true;
      # linger = true;

      # shell = pkgs.nushellFull;
      shell = pkgs.fish;

      initialHashedPassword = "$y$j9T$oJX8GijWaFwGIoyMQozuI0$IFMHCAQXsZIRLcRdFsifIT3ZJHuz9NcYHhHXPLA4cCA";

      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "audio"
        "video"
        "adbusers"
        "gamemode"
        "docker"
        "wireshark"
      ];
    };
  };

  programs.fish.enable = true;
}
