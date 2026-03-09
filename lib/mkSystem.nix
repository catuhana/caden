{
  nixosSystem,
  home-manager,
}:
{
  hostName,
  system,
  kind,
  extraModules ? [ ],
}:
nixosSystem {
  modules = [
    ../hosts/${hostName}

    {
      nixpkgs.hostPlatform = system;

      tuhana.system.kind = kind;
      networking.hostName = hostName;
    }

    home-manager.nixosModules.home-manager
  ]
  ++ extraModules;
}
