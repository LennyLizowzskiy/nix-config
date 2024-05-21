{ pkgs, ... }:

{
  home.packages = with pkgs; [ delta ];

  programs.lazygit = {
    enable = true;

    settings = {
      reporting = "off";
      disableStartupPopups = true;

      gui = {
        language = "en";
      };

      os = {
        editPreset = "nvim";
      };

      git = {
        commit = {
          signOff = true;
        };

        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
