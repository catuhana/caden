_: {
  caden.programs = {
    flatpak = {
      anydesk = {
        homeManager = _: {
          services.flatpak.packages = [ "com.anydesk.Anydesk" ];
        };
      };
    };
  };
}
