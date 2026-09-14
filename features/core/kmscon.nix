_: {
  caden.core = {
    kmscon = {
      nixos = _: {
        services.kmscon = {
          enable = true;
        };
      };
    };
  };
}
