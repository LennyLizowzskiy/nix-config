{ ... }:

{
  programs.git = {
    enable = true;

    delta = {
      enable = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.gh-dash.enable = true;
}
