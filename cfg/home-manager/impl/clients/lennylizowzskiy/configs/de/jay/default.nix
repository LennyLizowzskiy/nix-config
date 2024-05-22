{ lib, mainConfig, ... }:

if (mainConfig.local.de == "jay") then
  {
    wayland.windowManager.jay =
      let
        act = t: a: {
          type = t;
          exec = a;
        };
      in
      {
        enable = true;

        settings = {
          env = {
            GDK_SCALE = "${builtins.toString (builtins.elemAt mainConfig.local.hw.displays 0).scaling}";
          };

          on-graphics-initialized = [ (act "exec" "ironbar") ];

          outputs = [
            (
              let
                display0 = builtins.elemAt mainConfig.local.hw.displays 0;
              in
              {
                match.connector = display0.name;
                scale = display0.scaling;
                mode = {
                  width = builtins.elemAt display0.resolution 0;
                  height = builtins.elemAt display0.resolution 1;
                  refresh-rate = display0.refreshRate;
                };
              }
            )
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

            Super_F1 = act "switch-to-vt" 1;
            Super_F2 = act "switch-to-vt" 2;
            Super_F3 = act "switch-to-vt" 3;
            Super_F4 = act "switch-to-vt" 4;
            Super_F5 = act "switch-to-vt" 5;

            Super_1 = act "show-workspace" "1";
            Super_2 = act "show-workspace" "2";
            Super_3 = act "show-workspace" "3";
            Super_4 = act "show-workspace" "4";
            Super_5 = act "show-workspace" "5";
            Super_6 = act "show-workspace" "6";
            Super_7 = act "show-workspace" "7";
            Super_8 = act "show-workspace" "8";

            Super_shift-1 = act "move-to-workspace" "1";
            Super_shift-2 = act "move-to-workspace" "2";
            Super_shift-3 = act "move-to-workspace" "3";
            Super_shift-4 = act "move-to-workspace" "4";
            Super_shift-5 = act "move-to-workspace" "5";
          };

          # complex-shortcuts = {

          # };
        };
      };
  }
else
  { }
