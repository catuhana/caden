_: {
  caden.programs = {
    flatpak = {
      bottles = {
        homeManager = _: {
          services.flatpak.packages = [ "com.usebottles.bottles" ];
        };
      };
    };
  };
}
