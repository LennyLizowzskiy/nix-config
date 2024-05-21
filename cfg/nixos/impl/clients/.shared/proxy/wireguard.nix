{ pkgs, ... }:

{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  # TODO: wireguard
  # networking.wireguard.interfaces = { 
  #   wg0 = {
      
  #   };
  # };
}