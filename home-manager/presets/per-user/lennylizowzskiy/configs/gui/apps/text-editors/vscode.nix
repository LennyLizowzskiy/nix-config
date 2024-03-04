{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (symlinkJoin {
      name = "vscode-fhs-wrapped";

      paths = [
        (writeShellApplication {
          name = "code";
          text = "${coreutils}/bin/env -u WAYLAND_DISPLAY ${vscode-fhs}/bin/code";

          runtimeInputs = [ # all additional packages go there
            # Compilers / Runtimes
            nodePackages_latest.nodejs
            zig

            # LSP
            nixd
            #rust-analyzer
            slint-lsp
            zls
            typst-lsp
            biome
          ];
        })
        vscode-fhs
      ];
    })
  ];

  # maybe remove or move to the nixos conf
}