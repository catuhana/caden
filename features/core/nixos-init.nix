_: {
  caden.core = {
    nixos-init = {
      nixos = _: {
        system = {
          etc.overlay.enable = true;
          nixos-init.enable = true;
        };
      };
    };
  };
}
