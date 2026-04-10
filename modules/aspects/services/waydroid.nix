_: {
  caden.services = {
    provides.waydroid = {
      nixos = { pkgs, ... }: {
        virtualisation.waydroid = {
          enable = true;
          
          package = pkgs.waydroid-nftables;
        };
      };
    };
  };
}
