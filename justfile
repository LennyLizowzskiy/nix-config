pull:
    git pull

push:
    git add -A
    git commit -m "+"
    git push

system-update:
    rm -f ~/gtkrc-2.0*
    sudo nixos-rebuild switch --flake .?submodules=1

system-update-full:
    nix flake update
    just system-update

force-link-dots:
    ./etc/link-dots.sh ./dots