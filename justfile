system-update:
    sudo nixos-rebuild switch --flake .?submodules=1

system-update-full:
    nix flake update
    just system-update

force-link-dots:
    bash ./etc/link-dots.sh ./etc/dots