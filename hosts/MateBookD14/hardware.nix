_: {
  den.aspects = {
    MateBookD14 = {
      nixos =
        { pkgs, ... }:
        {
          boot = {
            kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

            kernelParams = [
              "xe.force_probe=46a6"
              "i915.force_probe=!46a6"
            ];
          };

          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
          };
        };
    };
  };
}
