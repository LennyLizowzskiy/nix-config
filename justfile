system-update:
    nix flake update
    sudo nixos-rebuild switch --flake .?submodules=1
