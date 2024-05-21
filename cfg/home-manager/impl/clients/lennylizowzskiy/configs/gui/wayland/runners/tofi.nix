{ ... }:

{
  programs.tofi = {
    enable = true;

    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "25%";
      result-spacing = 25;
      num-results = 8;
      # font = "monospace";
      # background-color = "#000A";
      # matching-algorithm = "fuzzy";
    };
  };
}
