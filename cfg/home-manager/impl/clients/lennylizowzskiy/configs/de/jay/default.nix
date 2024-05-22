{ lib, mainConfig, ... }:

if (mainConfig.local.de == "hyprland") then {
  wayland.windowManager.jay = 
  let
    act = t: a: { type = t; exec = a; };
  in
  {
    enable = true;

    settings = {
      env = {
        GDK_SCALE = "${mainConfig.local.hw.displays[0].scaling}";
      };

      on-graphics-initialized = [
        (act "exec" "ironbar")
      ];

      outputs = [
        (let
          display0 = mainConfig.local.hw.displays[0];
        in
        {
          match.connector = display0.name;
          scale = display0.scaling;
          mode = {
            width = display0.resolution[0];
            height = display0.resolution[1];
            refresh-rate = display0.refreshRate;
          };
        })
      ];

      inputs = [
        {

        }
      ];

      shortcuts = {
        Super_Q = act "exec" "terminal";
        Super_D = "toggle-floating";
        Super_F = "toggle-fullscreen";
        Super_C = "close";

        Super_H = "focus-left";
        Super_J = "focus-down";
        Super_K = "focus-up";
        Super_L = "focus-right";

        
      };


      # complex-shortcuts = {

      # };
    };
  };
} else {}