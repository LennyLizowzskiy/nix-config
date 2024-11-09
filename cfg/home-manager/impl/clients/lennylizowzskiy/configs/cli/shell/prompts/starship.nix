{
  programs.starship = {
    # enable = true;

    settings = {
      format = ''
        $kubernetes$directory$username$hostname$localip$shlvl$singularity$vcsh$fossil_branch$hg_branch$pijul_channel$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration$line_break$jobs$battery$time$status$os$container$shell$git_branch$git_commit$git_state$git_metrics$git_status
        $character
      '';

      cmd_duration = {
        disabled = true;
      };

      jobs = {
        disabled = true;
      };

      line_break = {
        disabled = true;
      };

      character = {
        format = " ";
      };

      sudo = {
        symbol = " ";
      };

      status = {
        symbol = " ";
        not_executable_symbol = " ";
        not_found_symbol = " ";
        sigint_symbol = " ";
        signal_symbol = " 󰭅";
      };

      directory = {
        fish_style_pwd_dir_length = 1;
        read_only = "󱪨";
      };

      git_branch = {
        symbol = " ";
      };

      git_commit = {
        tag_symbol = "  ";
      };

      git_status = {
        format = ''([\[( $conflicted)( $stashed)( $deleted)( $renamed)( $modified)( $staged)( $untracked)( $ahead_behind) \]]($style) )'';

        conflicted = "conflicted";
        ahead = "ahead";
        behind = "behind";
        diverged = "diverged";
        up_to_date = "up-to-date";
        untracked = "untracked";
        stashed = "stashed";
        modified = "modified";
        staged = "staged";
        renamed = "renamed";
        deleted = "deleted";
        typechanged = "type_changed";
      };

      container = {
        symbol = "";
      };

      docker_context = {
        symbol = "󰡨 ";
      };

      battery = {
        disabled = true;

        unknown_symbol = "󱉝";
        empty_symbol = "󰂎";
        charging_symbol = "󰂉";
        discharging_symbol = "󱟟";
        full_symbol = "󰂅";
      };

      java = {
        symbol = " ";
      };

      c = {
        symbol = "󰙱 ";
      };

      gradle = {
        symbol = " ";
      };

      dotnet = {
        symbol = "󰪮 ";
      };

      kotlin = {
        symbol = "󱈙 ";
      };

      bun = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛";
      };

      swift = {
        symbol = "󰛥 ";
      };

      lua = {
        symbol = "󰢱 ";
      };

      zig = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      package = {
        symbol = " ";
      };

      nix_shell = {
        symbol = "󱄅 ";
      };

      nodejs = {
        symbol = "󰎙 ";
      };

      guix_shell = {
        symbol = " ";
      };

      custom = {
        lazyvim = {
          symbol = " ";
          detect_files = [ "lazy-lock.json" ];
          style = "green";
        };

        nix = {
          symbol = " ";
          detect_files = [ "flake.nix" ];
          format = "via [$symbol]($style)";
          style = "white";
        };
      };
    };
  };
}
