{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ shadowsocks-rust ];
}
