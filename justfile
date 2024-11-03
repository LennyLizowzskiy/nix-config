commit:
    git commit -am "+"

wsl:
    sudo nixos-rebuild switch --option eval-cache false --flake .#wsl

update-flake:
    nix flake update

switch:
    sudo nixos-rebuild switch --option eval-cache false --show-trace --flake .

update: update-flake switch
