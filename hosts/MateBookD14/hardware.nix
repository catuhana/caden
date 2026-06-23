_: {
  den.aspects = {
    MateBookD14 = {
      nixos =
        { lib, pkgs, ... }:
        {
          boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

          hardware = {
            facter = {
              enable = true;
              reportPath = ./facter.json;
            };

            graphics.extraPackages = [
              pkgs.intel-media-driver
              pkgs.vpl-gpu-rt
            ];
          };

          environment.sessionVariables = {
            LIBVA_DRIVER_NAME = "iHD";
          };
        };
    };
  };
}
