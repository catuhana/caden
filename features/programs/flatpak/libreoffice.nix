_: {
  caden.programs = {
    flatpak = {
      libreoffice = {
        homeManager = _: {
          services.flatpak.packages = [ "org.libreoffice.LibreOffice" ];
        };
      };
    };
  };
}
