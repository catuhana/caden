_: {
  caden.core = {
    security = {
      tpm2 = {
        nixos = _: {
          security.tpm2 = {
            enable = true;
            pkcs11.enable = true;
            tctiEnvironment.enable = true;
          };
        };

        user = _: {
          extraGroups = [ "tss" ];
        };
      };
    };
  };
}
