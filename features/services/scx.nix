_: {
  caden.services = {
    scx = {
      nixos = _: {
        services.scx-loader = {
          enable = true;

          config.default_sched = "scx_bpfland";
        };
      };
    };
  };
}
