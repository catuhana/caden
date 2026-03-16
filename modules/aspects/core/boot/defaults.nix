{
  caden.core.boot.nixos =
    { pkgs, ... }:
    {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;

        loader = {
          systemd-boot = {
            enable = true;
            editor = false;
          };

          efi.canTouchEfiVariables = true;
          timeout = 0;
        };

        initrd.systemd.enable = true;

        tmp = {
          useTmpfs = true;
          tmpfsHugeMemoryPages = "within_size";
        };
      };
    };
}
