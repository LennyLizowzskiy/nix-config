{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      shell = {
        program = "zellij";
      };

      window = {
        decorations = "None";
      };
    };
  };
}
