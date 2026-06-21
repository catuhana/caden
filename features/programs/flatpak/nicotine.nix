_: {
  caden.programs = {
    flatpak = {
      nicotine = {
        homeManager = _: {
          services.flatpak.packages = [ "org.nicotine_plus.Nicotine" ];
        };
      };
    };
  };
}
