_: {
  caden.services = {
    flatpak = {
      nixos = _: {
        services.flatpak.enable = true;
      };

      homeManager = _: {
        services.flatpak = {
          enable = true;

          remotes = [
            {
              name = "flathub";
              location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
          ];
        };
      };
    };
  };
}
