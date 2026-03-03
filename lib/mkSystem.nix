{ inputs }:
{
  hostName,
  system,
  kind,
  extraModules ? [ ],
}:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit hostName;
  };

  modules = [
    { nixpkgs.hostPlatform = system; }
  ]
  ++ [
    # TODO: Modules should probably not be specified
    # here.
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
  ]
  ++ [ (inputs.self + /hosts/${hostName}) ]
  ++ [ { tuhana.system.kind = kind; } ]
  ++ extraModules;
}
