{
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs.pyprland = {
    enable = config.wayland.windowManager.hyprland.enable;
    # systemd.enable = true;

    package = inputs.pyprland.packages.${pkgs.system}.default;

    settings = {
      pyprland.plugins = [ "scratchpads" ];

      scratchpads = {
        term = {
          command = "foot --app-id __dropterm";
          animation = "fromTop";
          margin = 50;
          unfocus = "hide";
        };

        volume = {
          command = "pavucontrol";
          animation = "fromRight";
          unfocus = "hide";
        };
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "pypr &" ];

    bind =
      let
        mainMod = "SUPER";
      in
      [
        "${mainMod}, V, exec, pypr toggle volume"

        "${mainMod}, W, exec, pypr toggle term"
      ];

    windowrule =
      let
        scratchpavucontrol = "^(pavucontrol)$";
        scratchterm = "^(__dropterm)$";
      in
      [
        "workspace special:scratch_volume silent, ${scratchpavucontrol}"
        "float, ${scratchpavucontrol}"
        "size 40% 90%, ${scratchpavucontrol}"
        "move 200% 5%, ${scratchpavucontrol}"

        "workspace special:scratch_term silent, ${scratchterm}"
        "float, ${scratchterm}"
        "size 75% 60%, ${scratchterm}"
        "move 12% -200%, ${scratchterm}"
      ];
  };
}
