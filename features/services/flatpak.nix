_: {
  caden.services = {
    flatpak = {
      nixos = _: {
        services.flatpak.enable = true;
      };
    };
  };
}
