_: {
  caden.services = {
    provides.thermald = {
      nixos = _: {
        services.thermald = {
          enable = true;
        };
      };
    };
  };
}
