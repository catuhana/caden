_: {
  caden.security = {
    provides.apparmor = {
      nixos =
        { pkgs, ... }:
        {
          security.apparmor = {
            enable = true;
            packages = [ pkgs.apparmor-profiles ];
          };
        };
    };

    provides.tpm2 = {
      nixos = _: {
        security.tpm2 = {
          enable = true;

          pkcs11.enable = true;
          tctiEnvironment.enable = true;
        };
      };
    };
  };
}
