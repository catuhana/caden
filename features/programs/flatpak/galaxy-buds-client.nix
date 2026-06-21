_: {
  caden.programs = {
    flatpak = {
      galaxy-buds-client = {
        homeManager = _: {
          services.flatpak.packages = [ "me.timschneeberger.GalaxyBudsClient" ];
        };
      };
    };
  };
}
