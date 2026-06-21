_: {
  caden.programs = {
    flatpak = {
      obsidian = {
        homeManager = _: {
          services.flatpak.packages = [ "md.obsidian.Obsidian" ];
        };
      };
    };
  };
}
