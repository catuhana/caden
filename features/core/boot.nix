{ inputs, ... }:
{
  caden.core = {
    boot = {
      nixos =
        { lib, ... }:
        {
          boot = {
            loader = {
              systemd-boot = {
                enable = lib.mkDefault true;
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
        };

      secure-boot = {
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

      silent-boot = {
        nixos =
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
          };
      };

      plymouth = {
        nixos = _: {
          boot.plymouth.enable = true;
        };
      };
    };
  };
}
