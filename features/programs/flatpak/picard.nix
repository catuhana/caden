_: {
  caden.programs = {
    flatpak = {
      picard = {
        homeManager = _: {
          services.flatpak.packages = [ "org.musicbrainz.Picard" ];
        };
      };
    };
  };
}
