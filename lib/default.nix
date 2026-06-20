{ lib }:
{
  mkHomeAlias = import ./mkHomeAlias.nix { inherit lib; };
}
