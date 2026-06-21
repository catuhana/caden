_: {
  caden.programs = {
    flatpak = {
      fractal = {
        homeManager = _: {
          services.flatpak.packages = [ "org.gnome.Fractal" ];
        };
      };
    };
  };
}
