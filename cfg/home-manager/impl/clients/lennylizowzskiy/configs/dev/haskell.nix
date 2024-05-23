{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    haskell-language-server
    hlint

    cabal-install
    cabal2nix-unwrapped
  ];
}
