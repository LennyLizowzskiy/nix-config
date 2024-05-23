{ pkgs, ... }:

{
  home.packages = with pkgs; [ difftastic ];

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
          pager = "difft --background dark --color always";
        };
      };
    };
  };
}
