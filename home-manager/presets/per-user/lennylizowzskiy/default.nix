{ inputs, config, pkgs, lib, ... }:

let
  username = "lennylizowzskiy";
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    inputs.personalPkgs.homeManagerModules.default

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
    ./configs/cli/file-managers/lf
    ./configs/cli/git/git-cliff.nix
    # ./configs/cli/git/git-cred-oauth.nix
    ./configs/cli/git/git.nix
    ./configs/cli/git/lazygit.nix

    # ./configs/cli/shell/fish.nix
    ./configs/cli/shell/nushell

    ./configs/cli/text-editors/micro.nix
    ./configs/cli/text-editors/neovim
    ./configs/cli/text-editors/helix

    ./configs/dev/dev.nix
    ./configs/dev/rust.nix
    ./configs/dev/android-sdk.nix
    ./configs/dev/direnv.nix
    ./configs/dev/java.nix

    ./configs/gui/apps/obs.nix
    # ./configs/gui/apps/theming-gtkqt.nix
    ./configs/gui/apps/gaming/mangohud.nix
    ./configs/gui/apps/obsidian.nix

    # ./configs/gui/apps/terminals/kitty.nix
    ./configs/gui/apps/terminals/alacritty.nix
    ./configs/gui/apps/terminals/foot.nix

    # ./configs/gui/apps/text-editors/vscode.nix

    # ./configs/gui/de/hypr/hyprland-full.nix
  ];

  manual.manpages.enable = false;
  programs.man.enable = false;

  programs.git = {
    userName  = "Lenny Lizowzskiy";
    userEmail = "contact@lizowzskiy.su";
  };
}