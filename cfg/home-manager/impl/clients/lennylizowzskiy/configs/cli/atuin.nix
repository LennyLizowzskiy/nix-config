{ ... }:

{
  programs.atuin = {
    enable = true;
    settings = {
      update_check = false;
      style = "compact";
      show_help = false;
      store_failed = false;
      # invert = true;
      inline_height = 10;
      show_preview = true;
    };
  };
}
