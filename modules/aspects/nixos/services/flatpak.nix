_: {
  caden.services = {
    provides.flatpak = {
      nixos = _: {
        services.flatpak.enable = true;
      };
    };
  };
}
