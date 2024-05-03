{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.extraConfig.core.editor = "hx";
}
