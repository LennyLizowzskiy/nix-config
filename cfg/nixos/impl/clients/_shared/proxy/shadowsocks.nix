{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ shadowsocks-rust ];

  # environment.etc."shadowsocks.json".source = "${etcDir}/external/secrets/shadowsocks.json";
}
