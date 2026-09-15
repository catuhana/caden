_: {
  caden.services = {
    scx = {
      nixos = _: {
        services.scx-loader = {
          enable = true;

          default_sched = "scx_bpfland";
        };
      };
    };
  };
}
