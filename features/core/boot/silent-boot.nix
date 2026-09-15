{ lib, ... }:
{
  boot = {
    kernelParams = [
      "quiet"
      "udev.log_level=3"
    ];

    consoleLogLevel = lib.mkDefault 0;
    initrd.verbose = lib.mkDefault false;
  };
}
