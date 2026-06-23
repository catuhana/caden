_: {
  # TODO: Set up scx_loader.
  den.schema = {
    host =
      { lib, ... }:
      {
        options = {
          scx.scheduler = lib.mkOption {
            type = lib.types.nullOr lib.types.str;
            default = null;
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
              scheduler = lib.mkIf (host.scx.scheduler != null) host.scx.scheduler;
            };
          };
      };
  };
}
