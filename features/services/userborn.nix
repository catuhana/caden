_: {
  caden.services = {
    provides.userborn = {
      nixos = _: {
        services.userborn.enable = true;
      };
    };
  };
}
