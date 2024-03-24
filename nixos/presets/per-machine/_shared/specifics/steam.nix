{ ... }:

let
  gamescopeArgs = [
    "--expose-wayland"
    "-f"
    "-r 144"
    "-W 2560"
    "-H 1440"
  ];
in
{
  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = gamescopeArgs;
    };
  };

  programs.gamescope = {
    enable = true;
    args = gamescopeArgs;
  };
}