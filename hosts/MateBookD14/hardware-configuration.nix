{ pkgs, ... }:
{
  # TODO: This shouldn't be here?
  services.fwupd.enable = true;

  boot.kernelParams = [
    "xe.force_probe=46a6"
    "i915.force_probe=!46a6"
  ];

  hardware = {
    enableAllFirmware = true;

    cpu.intel.updateMicrocode = true;

    graphics.extraPackages = [ pkgs.intel-media-driver ];
  };
}
