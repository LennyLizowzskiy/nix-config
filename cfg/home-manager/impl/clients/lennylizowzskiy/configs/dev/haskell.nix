{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    haskell-language-server
    hlint
    haskellPackages.hlint-plugin

    cabal-install
    cabal2nix-unwrapped
  ];
}