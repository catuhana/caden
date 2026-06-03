_: {
  caden.services = {
    scx =
      { host, ... }:
      {
        nixos =
          { lib, ... }:
          {
            services.scx = {
              enable = true;
            }
            // lib.optionalAttrs (host.caden.services.scx.scheduler != null) {
              scheduler = host.caden.services.scx.scheduler;
            };
          };
      };
  };
}
