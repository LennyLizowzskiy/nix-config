{ inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      use-xdg-base-directories = true;
      flake-registry = null;
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
        "ca-derivations"
        # "big-parallel"
      ];
      # trusted-users = [
      #   "root"
      #   "@wheel"
      #   config.users.users.default.name
      # ];
      keep-outputs = true;
      keep-derivations = true;
      keep-env-derivations = true;

      substituters = [
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://cache.garnix.io"
        "https://numtide.cachix.org"
        # "https://eigenvalue.cachix.org"
        "https://crane.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        # "eigenvalue.cachix.org-1:ykerQDDa55PGxU25CETy9wF6uVDpadGGXYrFNJA3TUs="
        "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
      ];
    };

    registry.n.flake = inputs.nixpkgs;
    registry.crane.flake = inputs.crane;
  };
}
