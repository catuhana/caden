_: {
  caden.services = {
    openssh = {
      nixos = _: {
        services.openssh = {
          enable = true;
          startWhenNeeded = true;

          settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
          };
        };
      };
    };
  };
}
