{ pkgs, lib, ... }:

let
  # autogen = pkgs.callPackage ./_sources/generated.nix { };

in
# mkHomePaths = (
#   packs:
#   (builtins.foldl' (acc: x: acc // { ".misc/fetched/${x.pname}".source = x.src; }) { } (
#     lib.attrsets.attrValues packs
#   ))
# );
{
  home.packages = with pkgs; [ nvfetcher ];

  # home.file = mkHomePaths autogen;
}
