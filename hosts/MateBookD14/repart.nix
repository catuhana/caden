_: {
  den.aspects = {
    MateBookD14 = {
      nixos = _: {
        boot = {
          loader = {
            efi.efiSysMountPoint = "/efi";
            systemd-boot.xbootldrMountPoint = "/boot";
          };

          initrd = {
            availableKernelModules = [ "dm_crypt" ];

            systemd.repart = {
              enable = true;

              device = "/dev/nvme0n1";
              empty = "allow";
            };

            luks.devices = {
              swap = {
                device = "/dev/disk/by-partlabel/swap";
                allowDiscards = true;

                crypttabExtraOpts = [
                  "tpm2-device=auto"
                  "tpm2-with-pin=yes"
                ];
              };

              root = {
                device = "/dev/disk/by-partlabel/root-x86-64";
                allowDiscards = true;

                crypttabExtraOpts = [
                  "tpm2-device=auto"
                  "tpm2-with-pin=yes"

                  "no-read-workqueue"
                  "no-write-workqueue"
                ];
              };
            };
          };
        };

        systemd.repart = {
          partitions = {
            "00-esp" = {
              Type = "esp";
              SizeMaxBytes = "128M";
              Format = "vfat";
            };
            "05-xbootldr" = {
              Type = "xbootldr";
              SizeMaxBytes = "1G";
              Format = "vfat";
            };

            "10-swap" = {
              Type = "swap";
              SizeMinBytes = "16G";
              SizeMaxBytes = "20G";
              Encrypt = "tpm2";
            };

            "20-root" = {
              Type = "root";
              Format = "btrfs";
              Encrypt = "key-file+tpm2";
              Subvolumes = "/@ /@home /@nix";
              DefaultSubvolume = "/@";
              MakeDirectories = "/@ /@home /@nix";
            };
          };
        };

        fileSystems = {
          "/efi" = {
            device = "/dev/disk/by-partlabel/esp";
            fsType = "vfat";
          };
          "/boot" = {
            device = "/dev/disk/by-partlabel/xbootldr";
            fsType = "vfat";
            options = [ "umask=0077" ];
          };

          "/" = {
            device = "/dev/mapper/root";
            fsType = "btrfs";
            options = [
              "subvol=/@"
              "compress=zstd"
            ];
          };
          "/home" = {
            device = "/dev/mapper/root";
            fsType = "btrfs";
            options = [
              "subvol=/@home"
              "compress=zstd"
            ];
          };
          "/nix" = {
            device = "/dev/mapper/root";
            fsType = "btrfs";
            options = [
              "subvol=/@nix"
              "compress=zstd"
            ];
          };
        };
      };
    };
  };
}
