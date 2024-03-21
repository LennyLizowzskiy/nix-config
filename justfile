pull:
    git pull

push:
    git add -A
    git commit -m "+"
    git push

system-clean:
    nix-collect-garbage --delete-older-than 7d
    sudo nix-collect-garbage --delete-older-than 7d
    sudo nix store gc

system-update:
    rm -f ~/.gtkrc-2.0*
    sudo nixos-rebuild switch --flake .?submodules=1

system-update-full:
    nix flake update
    just system-update

force-link-dots:
    ./etc/link-dots.sh ./dots