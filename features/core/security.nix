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

        provides.to-users = {
          user = _: {
            extraGroups = [ "tss" ];
          };
        };
      };
    };
  };
}
