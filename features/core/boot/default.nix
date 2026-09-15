{ lib, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        enable = lib.mkDefault true;

        bootCounting.enable = true;

        configurationLimit = 12;
        editor = false;
      };

      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    tmp = {
      useTmpfs = true;
      tmpfsHugeMemoryPages = "within_size";
    };
  };
}
