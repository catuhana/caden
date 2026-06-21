_: {
  den.schema = {
    host =
      { lib, ... }:
      {
        options = {
          caden.services.scx.scheduler = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
            description = "The sched_ext scheduler to use, or null for the default.";
          };
        };
      };
  };

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
