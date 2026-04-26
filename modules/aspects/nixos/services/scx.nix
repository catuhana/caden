_: {
  caden.services = {
    provides.scx = {
      nixos = _: {
        services.scx = {
          enable = true;
          # Figure out a way to configure this on different hosts.
          # scheduler = "scx_lavd";
        };
      };
    };
  };
}
