system-update:
    sudo nixos-rebuild switch --flake .?submodules=1

system-update-full:
    nix flake update
    just system-update

force-link-dots:
    ./etc/link-dots.sh ./dots