_: {
  caden.programs = {
    flatpak = {
      obs-studio = {
        homeManager = _: {
          services.flatpak.packages = [ "com.obsproject.Studio" ];
        };
      };
    };
  };
}
