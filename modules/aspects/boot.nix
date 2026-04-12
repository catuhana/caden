{
  inputs,
  ...
}:
{
  caden.boot = {
    nixos =
      { pkgs, lib, ... }:
      {
        boot = {
          kernelPackages = pkgs.linuxPackages_zen;

          loader = {
            systemd-boot = {
              enable = lib.mkDefault true;
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

    provides.secure-boot = {
      nixos =
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
    };

    provides.silent-boot = {
      nixos = _: {
        boot = {
          kernelParams = [
            "quiet"
            "udev.log_level=3"
          ];

          consoleLogLevel = 0;
          initrd.verbose = false;
        };
      };
    };

    provides.plymouth = {
      nixos = _: {
        boot.plymouth.enable = true;
      };
    };
  };
}
