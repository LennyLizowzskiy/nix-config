commit:
    git commit -am "+"

update-flake:
    nix flake update

switch:
    sudo nixos-rebuild switch --option eval-cache false --flake ".?submodules=1"

update: update-flake switch
