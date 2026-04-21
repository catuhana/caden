{
  inputs,
  __findFile,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = { };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        <caden/audio>

        <caden/boot>
        <caden/boot/secure-boot>
        <caden/boot/silent-boot>
        <caden/boot/plymouth>

        <caden/gnome>

        <caden/locale>
        <caden/locale/tr_TR>

        <caden/networking>
        <caden/networking/resolved>
        <caden/networking/resolved/mdns>
        <caden/networking/dns/cloudflare>

        <caden/programs/git>
        <caden/programs/msedit>

        #<caden/security/apparmor>
        <caden/security/tpm2>

        <caden/services/flatpak>
        <caden/services/openssh>
        <caden/services/scx>
        <caden/services/thermald>
        <caden/services/usbmuxd>
      ];

      nixos =
        { pkgs, ... }:
        {
          imports = [ inputs.disko.nixosModules.default ];

          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
          };

          boot.kernelParams = [
            "xe.force_probe=46a6"
            "i915.force_probe=!46a6"
          ];

          disko.devices = {
            disk = {
              main = {
                device = "/dev/nvme0n1";
                type = "disk";

                content = {
                  type = "gpt";

                  partitions = {
                    esp = {
                      name = "boot";
                      type = "EF00";
                      size = "1G";

                      content = {
                        type = "filesystem";
                        format = "vfat";

                        mountpoint = "/boot";
                        mountOptions = [ "umask=0077" ];
                      };
                    };

                    luks = {
                      name = "luks";
                      size = "100%";

                      content = {
                        name = "cryptroot";
                        type = "luks";

                        settings = {
                          allowDiscards = true;
                          bypassWorkqueues = true;
                          crypttabExtraOpts = [ "tpm2-device=auto" ];
                        };

                        content = {
                          type = "lvm_pv";
                          vg = "system";
                        };
                      };
                    };
                  };
                };
              };
            };

            lvm_vg = {
              system = {
                type = "lvm_vg";

                lvs = {
                  swap = {
                    size = "20G";
                    content = {
                      type = "swap";
                      resumeDevice = true;
                    };
                  };

                  root = {
                    size = "100%";
                    content = {
                      type = "btrfs";
                      extraArgs = [ "-f" ];

                      subvolumes = {
                        "@" = {
                          mountpoint = "/";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                        "@home" = {
                          mountpoint = "/home";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        };
    };
  };
}
