{
  inputs,
  mainConfig,
  ...
}:

{
  imports = [
    inputs.personalPkgs.homeManagerModules.default

    ./configs/command-not-found.nix
    ./configs/nix.nix
    ./configs/stylix.nix
    # ./configs/boilerplate.nix

    ./configs/cli/aria2.nix
    ./configs/cli/bat.nix
    ./configs/cli/btop.nix
    ./configs/cli/eza.nix
    ./configs/cli/fastfetch.nix
    ./configs/cli/fzf.nix
    ./configs/cli/less.nix
    ./configs/cli/yt-dlp.nix
    ./configs/cli/zoxide.nix
    ./configs/cli/zellij.nix
    ./configs/cli/atuin.nix
    # ./configs/cli/file-managers/lf
    ./configs/cli/file-managers/yazi

    ./configs/vcs/jj/jj.nix
    ./configs/vcs/git/git-cliff.nix
    # ./configs/vcs/git/git-cred-oauth.nix
    ./configs/vcs/git/git.nix
    ./configs/vcs/git/lazygit.nix

    ./configs/cli/shell/fish.nix
    ./configs/cli/shell/nushell

    ./configs/cli/text-editors/micro.nix
    ./configs/cli/text-editors/neovim
    ./configs/cli/text-editors/helix

    ./configs/dev/dev.nix
    ./configs/dev/rust.nix
    ./configs/dev/android-sdk.nix
    ./configs/dev/idea.nix
    ./configs/dev/direnv.nix
    ./configs/dev/java.nix

    # ./configs/gui/theming-gtkqt.nix
    ./configs/gui/apps/feh.nix
    ./configs/gui/apps/obs.nix
    ./configs/gui/apps/gaming/mangohud.nix
    ./configs/gui/apps/obsidian.nix

    ./configs/gui/apps/terminals/kitty.nix
    ./configs/gui/apps/terminals/alacritty.nix
    ./configs/gui/apps/terminals/foot.nix

    ./configs/gui/apps/text-editors/vscode.nix

    ./configs/de/niri
    ./configs/de/hypr

    ./configs/services/secrets/gnupg.nix
  ];

  manual.manpages.enable = false;
  programs.man.enable = false;

  home.shellAliases = {
    "." = "ls -a";
    "lss" = "eza --tree";
    ".." = "cd ..";
    "..." = "cd ../..";
  };

  programs.git = {
    userName = "Lenny Lizowzskiy";
    userEmail = "contact@lizowzskiy.ru";

    extraConfig = {
      user.signingkey = "${mainConfig.keysDir}/pgp-public.converted.ssh_pub";
      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };
}
