_: {
  caden.programs = {
    flatpak = {
      plume-impactor = {
        homeManager = _: {
          services.flatpak.packages = [ "dev.khcrysalis.PlumeImpactor" ];
        };
      };
    };
  };
}
