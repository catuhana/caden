_: {
  caden.services = {
    thermald = {
      nixos = _: {
        services.thermald.enable = true;
      };
    };
  };
}
