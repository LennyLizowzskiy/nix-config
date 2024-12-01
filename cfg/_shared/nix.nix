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
        # "https://cache.garnix.io"
        "https://numtide.cachix.org"
        "https://cosmic.cachix.org"        
        "https://crane.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        "crane.cachix.org-1:8Scfpmn9w+hGdXH/Q9tTLiYAE/2dnJYRJP7kl80GuRk="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };

    registry.n.flake = inputs.nixpkgs;
    registry.crane.flake = inputs.crane;
  };
}
