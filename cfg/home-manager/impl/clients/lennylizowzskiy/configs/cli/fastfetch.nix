{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "none";
      };

      display = {
        disableLinewrap = false;
        hideCursor = false;
        size.binaryPrefix = "jedec";
        # temp = "ndigits";
        # unit = "CELSIUS";
      };

      modules = [
        "os"
        "kernel"
        "cpu"
        "gpu"
        "display"
        "de"
        "wm"
        "shell"
        "terminal"
      ];
    };
  };
}
