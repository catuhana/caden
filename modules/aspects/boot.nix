{
  inputs,
  ...
}:
{
  caden.boot = {
    nixos =
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

    provides.secure-boot.nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

        environment.systemPackages = [ pkgs.sbctl ];

        boot = {
          loader.systemd-boot.enable = false;

          lanzaboote = {
            enable = true;

            pkiBundle = "/var/lib/sbctl";

            autoGenerateKeys.enable = true;
          };
        };
      };

    provides.silent-boot.nixos = {
      boot = {
        kernelParams = [
          "quiet"
          "udev.log_level=3"
        ];

        consoleLogLevel = 0;
        initrd.verbose = false;
      };
    };

    provides.plymouth.nixos = {
      boot.plymouth.enable = true;
    };
  };
}
