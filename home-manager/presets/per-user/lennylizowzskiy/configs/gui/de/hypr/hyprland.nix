{
  config,
  pkgs,
  hostname,
  inputs,
  ...
}:

let
  scaling = {
    rher = "2";
    grogoroth = "1";
  };

  monitors = {
    rher = [ ", highres, auto, ${scaling.rher}" ];

    grogoroth = [ ", highrr, auto, ${scaling.grogoroth}" ];
  };
in
{
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    brightnessctl
    wireplumber
    imagemagick
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    # extraConfig = ''
    #   plugin = ${inputs.hy3.packages.x86_64-linux.hy3}/lib/libhy3.so
    # '';

    settings = {
      # exec-once = [
      #   "hyprctl setcursor \"Phinger Cursors\" ${builtins.toString config.home.pointerCursor.size}"
      # ];

      # plugins = [ "${inputs.hy3.packages.${pkgs.system}.hy3}/lib/libhy3.so" ];

      # hy3 = {
      #   tabs = {
      #     text_font = "monospace";
      #   };
      #
      #   autotile = {
      #     enable = "true";
      #   };
      # };

      monitor = monitors."${hostname}";

      xwayland = {
        force_zero_scaling = "true";
      };

      env = [
        "GDK_SCALE, ${scaling."${hostname}"}"
        "WLR_DRM_NO_ATOMIC, 1"
      ];

      general = {
        allow_tearing = "true";
        gaps_in = "2";
        gaps_out = "0";
        border_size = "2";
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"; # stylix
        # "col.inactive_border" = "rgba(595959aa)";
        no_focus_fallback = "true";
        no_cursor_warps = "true";

        layout = "dwindle";
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
        numlock_by_default = "true";

        follow_mouse = "1";
        mouse_refocus = "false";

        touchpad = {
          natural_scroll = "true";
          middle_button_emulation = "true";
          tap-and-drag = "true";
        };

        sensitivity = "0";
      };

      decoration = {
        rounding = "0";

        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        # "col.shadow" = "rgba(1a1a1aee)";
      };

      misc = {
        vrr = "1";
        disable_splash_rendering = "true";
        force_default_wallpaper = "0";
      };

      animations = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      gestures = {
        workspace_swipe = "true";
        workspace_swipe_cancel_ratio = "0.3";
      };

      windowrule =
        let
          pip = "title:^(Picture in picture)$";
          idea = "^jetbrains-idea.*";
          jb-toolbox = "^(jetbrains-toolbox)$";
          android-studio = "^jetbrains-studio.*";
          vscode = "^(Code)$";
          xwaylandvideobridge = "^(xwaylandvideobridge)$";
          openFolderWindow = "title:^(Open Folder)";
        in
        [
          "tile, ^(lite-xl)$"

          "pin, ${pip}"
          "float, ${pip}"
          "noborder, ${pip}"
          "noshadow, ${pip}"
          "move cursor 0 0, ${pip}"

          "forceinput, ${idea}"
          "noborder, ${idea}"
          "immediate, ${idea}"
          "windowdance, ${idea}"
          # "center, ${idea}"

          "forceinput, ${android-studio}"
          "noborder, ${android-studio}"
          "immediate, ${android-studio}"
          "windowdance, ${android-studio}"
          # "center, ${idea}"

          "forceinput, ${jb-toolbox}"
          "move 100%-20% 5%, ${jb-toolbox}"
          "pin, ${jb-toolbox}"
          "noborder, ${jb-toolbox}"

          "forceinput, ${vscode}"
          "noborder, ${vscode}"
          "windowdance, ${vscode}"

          "maxsize 60% 40%, ${openFolderWindow}"
          "center 1, ${openFolderWindow}"

          "opacity 0.0 override 0.0 override, ${xwaylandvideobridge}"
          "noanim, ${xwaylandvideobridge}"
          "noinitialfocus, ${xwaylandvideobridge}"
          "maxsize 1 1, ${xwaylandvideobridge}"
          "noblur, ${xwaylandvideobridge}"
        ];

      windowrulev2 = [

      ];

      bindm =
        let
          mainMod = "SUPER";
          buttons = {
            LMB = "mouse:272";
            RMB = "mouse:273";
          };
        in
        with buttons;
        [
          "${mainMod}, ${LMB}, movewindow"
          "${mainMod}, ${RMB}, resizewindow"
        ];

      bind =
        let
          mainMod = "SUPER";
          buttons = {
            brightnessUp = "code:233";
            brightnessDown = "code:232";

            volumeUp = "code:123";
            volumeDown = "code:122";

            screenshot = "code:107";
          };
          commands = {
            screenshotArea = "grim -g \"\$(slurp)\" - | convert - -shave 2x2 PNG:- | wl-copy";
            screenshotAreaAndEdit = "grim -g \"\$(slurp)\" - | convert - -shave 2x2 PNG:- | swappy -f -";
            movewindow = "movewindow";
            movefocus = "movefocus";
          };
        in
        with commands;
        [
          ", ${buttons.brightnessUp}, exec, brightnessctl set +10%"
          ", ${buttons.brightnessDown}, exec, brightnessctl set 10%-"

          ", ${buttons.volumeUp}, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
          ", ${buttons.volumeDown}, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"

          ", ${buttons.screenshot}, exec, ${screenshotArea}"
          ", ${buttons.screenshot}, exec, ${screenshotAreaAndEdit}"
          "SUPER SHIFT, S, exec, ${screenshotArea}"
          "SUPER SHIFT ALT, S, exec, ${screenshotAreaAndEdit}"

          "${mainMod}, Q, exec, foot"

          "${mainMod}, C, killactive,"
          "${mainMod}, M, exit,"
          "${mainMod}, D, togglefloating,"

          "${mainMod}, F, fullscreen, 0"
          "${mainMod} SHIFT, F, fullscreen, 1"
          "${mainMod} CTRL, F, fakefullscreen,"

          # "${mainMod}, left, movefocus, l"
          # "${mainMod}, right, movefocus, r"
          # "${mainMod}, up, movefocus, u"
          # "${mainMod}, down, movefocus, d"
          "${mainMod}, H, ${movefocus}, l"
          "${mainMod}, J, ${movefocus}, d"
          "${mainMod}, K, ${movefocus}, u"
          "${mainMod}, L, ${movefocus}, r"
          "${mainMod} SHIFT, H, ${movewindow}, l"
          "${mainMod} SHIFT, J, ${movewindow}, r"
          "${mainMod} SHIFT, K, ${movewindow}, u"
          "${mainMod} SHIFT, L, ${movewindow}, d"

          # "${mainMod}, T, hy3:makegroup"
          # "${mainMod}, R, hy3:changegroup, toggletab"

          "${mainMod}, mouse_down, workspace, e+1"
          "${mainMod}, mouse_up, workspace, e-1"

          "${mainMod}, S, exec, tofi-drun --drun-launch=true"
          # "${mainMod}, S, exec, hyprctl dispatch exec $(tofi-run)"

          "ALT, Tab, workspace, previous"

          "${mainMod}, 1, workspace, 1"
          "${mainMod}, 2, workspace, 2"
          "${mainMod}, 3, workspace, 3"
          "${mainMod}, 4, workspace, 4"
          "${mainMod}, 5, workspace, 5"
          "${mainMod}, 6, workspace, 6"
          "${mainMod}, 7, workspace, 7"
          "${mainMod}, 8, workspace, 8"
          "${mainMod}, 9, workspace, 9"
          "${mainMod}, 0, workspace, 10"

          "${mainMod} SHIFT, 1, movetoworkspace, 1"
          "${mainMod} SHIFT, 2, movetoworkspace, 2"
          "${mainMod} SHIFT, 3, movetoworkspace, 3"
          "${mainMod} SHIFT, 4, movetoworkspace, 4"
          "${mainMod} SHIFT, 5, movetoworkspace, 5"
          "${mainMod} SHIFT, 6, movetoworkspace, 6"
          "${mainMod} SHIFT, 7, movetoworkspace, 7"
          "${mainMod} SHIFT, 8, movetoworkspace, 8"
          "${mainMod} SHIFT, 9, movetoworkspace, 9"
          "${mainMod} SHIFT, 0, movetoworkspace, 10"

          "${mainMod} ALT, 1, movetoworkspacesilent, 1"
          "${mainMod} ALT, 2, movetoworkspacesilent, 2"
          "${mainMod} ALT, 3, movetoworkspacesilent, 3"
          "${mainMod} ALT, 4, movetoworkspacesilent, 4"
          "${mainMod} ALT, 5, movetoworkspacesilent, 5"
          "${mainMod} ALT, 6, movetoworkspacesilent, 6"
          "${mainMod} ALT, 7, movetoworkspacesilent, 7"
          "${mainMod} ALT, 8, movetoworkspacesilent, 8"
          "${mainMod} ALT, 9, movetoworkspacesilent, 9"
          "${mainMod} ALT, 0, movetoworkspacesilent, 10"
        ];
    };
  };
}