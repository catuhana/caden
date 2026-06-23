_: {
  caden.core = {
    kmscon = {
      nixos = _: {
        services.kmscon = {
          enable = true;

          config.hwaccel = true;
        };
      };
    };
  };
}
