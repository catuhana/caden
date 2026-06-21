_: {
  caden.programs = {
    flatpak = {
      protonvpn = {
        homeManager = _: {
          services.flatpak.packages = [ "com.protonvpn.www" ];
        };
      };
    };
  };
}
