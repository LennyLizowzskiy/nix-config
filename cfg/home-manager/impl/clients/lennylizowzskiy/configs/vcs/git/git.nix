{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git-open
    git-extras
  ];

  home.shellAliases = {
    "g" = "git";
  };

  programs.git = {
    enable = true;

    # delta = {
    #   enable = true;
    # };
    difftastic = {
      enable = true;
      color = "always";
    };

    ignores = [
      "*~"
      "node_modules/"
      "result/"
      ".idea/"
      ".gradle/"
      ".direnv/"
      "build/"
      "local.properties"
      "/tmp"
      "/bin"
      "*.log"
      "vcs.xml"
      "lint/"
      ".DS_Store"
    ];

    extraConfig = {
      fetch.prune = true;

      color = {
        status = "auto";
        branch = "auto";
        diff = "auto";
      };

      branch = {
        autosetuprebase = "always";
      };

      alias = {
        pull = "pull --rebase";

        lease = "push --force-with-lease --force-if-includes"; # abort force-push if new commits in the origin are found

        sub = "submodule";
        subup = "submodule update --init --recursive";

        st = "status -s";
        sta = "status";

        co = "checkout";
        cod = "checkout ."; # delete all changes since last commit

        ci = "commit";
        cia = "commit --amend";
        ciaf = "commit --amend --no-edit";

        amend = "commit --amend";
        amendf = "commit --amend --no-edit";

        forgot = "commit -a --amend --no-edit";

        edit = "commit --amend";

        br = "branch";
        bra = "branch -a";

        d = "diff";
        dw = "diff -w"; # split window diff view
        dws = "dw --staged";

        f = "fetch";
        fop = "fetch origin --prune"; # fetch & clean local branches

        cl = "clone";
        cls = "clone --depth 1 --single-branch";

        cdf = "clean -d --force"; # delete all unstaged changes

        rh = "reset HEAD"; # unstage changes

        wa = "worktree add";
        wl = "worktree list";
        wls = "worktree list";
        wr = "worktree remove";

        tags = "tag -l";
        branches = "branch -a";
        remotes = "remote -v";

        a = "add";
        aa = "add --all";

        hist = "log --one-line -10";
        l = "log -16 --color=always --all --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        ll = "log --color=always --all --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        lg = "log -10 --color=always --all --graph --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        lgl = "log --color=always --all --graph --topo-order --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

        # out = "log @{u}..";
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
