_: {
  caden.core = {
    security = {
      tpm2 = {
        nixos = _: {
          security.tpm2 = {
            enable = true;
          };
        };
      };
    };
  };
}
