{ pkgs, ... }:

{
  imports = [
    ./prompts/starship.nix
  ];

  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      { name = "z"; src = z.src; }
      { name = "sponge"; src = sponge.src; }
      { name = "puffer"; src = puffer.src; }
      { name = "pisces"; src = pisces.src; }
      { name = "hydro"; src = hydro.src; }
      { name = "humantime-fish"; src = humantime-fish.src; }
      { name = "colored-man-pages"; src = colored-man-pages.src; }
    ];

    interactiveShellInit = ''
      set -g fish_greeting # Disable greeting

      set -l nix_shell_info (
        if test -n "$IN_NIX_SHELL"
          echo -n "<nix-shell> "
        end
      )
    '';

    functions = {
      "nix-shell" = {
        body = "${pkgs.any-nix-shell}/bin/.any-nix-shell-wrapper fish $argv";
      };

      "nix" = {
        body = ''
          if test $argv[1] = shell
              set argv[1] fish
              ${pkgs.any-nix-shell}/bin/.any-nix-wrapper $argv
          else
              command nix $argv
          end
        '';
      };
    };
  };
}