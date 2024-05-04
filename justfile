pull:
    git pull

push:
    git add -A
    git commit -m "+"
    git push origin

system-clean:
    nix-collect-garbage --delete-older-than 7d
    sudo nix-collect-garbage --delete-older-than 7d
    sudo nix store gc

update:
    sudo nixos-rebuild switch --flake ".?submodules=1"

update-full:
    nix flake update
    just update

force-link-dots:
    ./etc/link-dots.sh ./dots
