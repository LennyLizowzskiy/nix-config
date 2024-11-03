{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/settings.json" = {
    text = builtins.toJSON {
      vim_mode = true;
      theme = {
        mode = "dark";
        dark = "Kanagawa Dragon";
        light = "One Light";
      };
      ui_font_size = 18;
      buffer_font_size = 18;
      autosave = {
        after_delay = {
          milliseconds = 2000;
        };
      };
      auto_install_extensions = {
        html = true;
        dockerfile = true;
        docker-compose = true;
        xml = true;
        scss = true;
        lua = true;
        graphql = true;
        biome = true;
        colorizer = true;
        vue = true;
        just = true;
        kanagawa-themes = true;
        ini = true;
        nu = true;
        nix = true;
        nginx = true;
      };
      auto_update = false;
      base_keymap = "VSCode";
      buffer_font_family = "Lilex";
      buffer_font_features = {
        cv03 = true;
        zero = true;
        cv06 = true;
        ss02 = true;
        ss03 = true;
        ss04 = true;
        cv09 = true;
      };
      load_direnv = "direct";
      lsp = {
        rust_analyzer = {
          imports = {
            granularity = {
              group = "module";
            };
            prefix = "self";
          };
          cargo = {
            allFeatures = true;
            targetDir = true;
            buildScripts = {
              enable = true;
            };
            loadOutDirsFromCheck = true;
            runBuildScripts = true;
          };
          check = {
            command = "clippy";
            allTargets = false;
          };
          procMacro = {
            enable = true;
            ignored = {
              leptos_macro = [ "server" ];
            };
          };
          rustfmt = {
            overrideCommand = [
              "leptosfmt"
              "--stdin"
              "--rustfmt"
            ];
          };
        };
      };
      languages = {
        Rust = {
          code_actions_on_format = {
            "source.organizeImports" = true;
          };
        };
        Nix = {
          tab_size = 2;
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
          remove_trailing_whitespace_on_save = true;
          soft_wrap = "editor_width";
        };
      };
      git = {
        inline_blame = {
          enabled = true;
          delay_ms = 2000;
          show_commit_summary = true;
        };
      };
      journal = {
        hour_format = "hour24";
      };
      search = {
        case_sensitive = true;
        regex = true;
      };
      telemetry = {
        diagnostics = true;
        metrics = false;
      };
      terminal = {
        env = {
          IN_IDE = "1";
          ZED = "1";
        };
      };
      assistant = {
        enabled = false;
        button = false;
        version = "2";
      };
    };
  };
}
