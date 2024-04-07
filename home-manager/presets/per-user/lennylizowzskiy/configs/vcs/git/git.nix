{ extraArgs, ... }:

{
  home.shellAliases = {
    "g" = "git";
  };

  programs.git = {
    enable = true;

    delta = {
      enable = true;
    };

    ignores = [
      "*~"
      "node_modules/"
      "result/"
      ".idea/"
      ".gradle/"
      "build/"
      "local.properties"
      "/tmp"
      "*.log"
      "vcs.xml"
      "lint/"
      ".DS_Store"
    ];

    extraConfig = {
      user.signingkey = "${extraArgs.etcDir}/keys/pgp-public.converted.ssh_pub";
      gpg.format = "ssh";

      fetch.prune = true;
      core = {
        editor = "nvim";
      };

      color = {
        status = "auto";
        branch = "auto";
        diff = "auto";
      };

      branch = {
        autosetuprebase = "always";
      };

      alias = {
        pull = "pull --ff-only";

        st = "status";
        co = "checkout";
        cm = "commit";
        br = "branch";
        d = "diff";
        
        tags = "tag -l";
        branches = "branch -a";
        remotes = "remote -v";

        aa = "add --all";
        reh = "reset --hard HEAD";
        l = "log -16 --color=always --all --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        ll = "log --color=always --all --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        lg = "log -10 --color=always --all --graph --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        lgl = "log --color=always --all --graph --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

        out = "log @{u}..";
        fixup = "commit --fixup=HEAD";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.gh-dash.enable = true;
}
