{
  self,
  nixpkgs,
  disko,
  home-manager,
  lanzaboote,
}:
{ hostname, system }:
{
  ${hostname} = nixpkgs.lib.nixosSystem {
    inherit system;

    modules = [
      disko.nixosModules.default
      home-manager.nixosModules.home-manager
      lanzaboote.nixosModules.lanzaboote

      (self + "/features/core/common.nix")
      (self + "/hosts/${hostname}")
    ];
  };
}
