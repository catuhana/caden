{ inputs, ... }:
{
  den.aspects = {
    MateBookD14 = {
      nixos = _: {
        imports = [ inputs.disko.nixosModules.default ];

        boot.loader = {
          efi.efiSysMountPoint = "/efi";
          systemd-boot.xbootldrMountPoint = "/boot";
        };

        virtualisation.vmVariantWithDisko.virtualisation = {
          cores = 16;

          memorySize = 8 * 1024;

          qemu.options = [
            "-device virtio-vga-gl"
            "-display gtk,gl=on,show-cursor=on"
            "-cpu host"
          ];
        };

        disko.devices = {
          disk = {
            main = {
              device = "/dev/nvme0n1";
              type = "disk";

              imageSize = "32G";

              content = {
                type = "gpt";

                partitions = {
                  esp = {
                    priority = 1;
                    type = "EF00";
                    size = "1G";

                    content = {
                      type = "filesystem";
                      format = "vfat";

                      mountpoint = "/efi";
                      mountOptions = [ "umask=0077" ];
                    };
                  };

                  boot = {
                    priority = 2;
                    type = "EA00";
                    size = "2G";

                    content = {
                      type = "filesystem";
                      format = "vfat";

                      mountpoint = "/boot";
                      mountOptions = [ "umask=0077" ];
                    };
                  };

                  swap = {
                    priority = 3;
                    size = "16G";

                    content = {
                      name = "cryptswap";
                      type = "luks";

                      settings = {
                        allowDiscards = true;
                        crypttabExtraOpts = [
                          "tpm2-device=auto"
                          "tpm2-with-pin=yes"
                        ];
                      };

                      content = {
                        type = "swap";
                        resumeDevice = true;
                      };
                    };
                  };

                  root = {
                    size = "100%";

                    content = {
                      name = "cryptroot";
                      type = "luks";

                      settings = {
                        allowDiscards = true;
                        bypassWorkqueues = true;
                        crypttabExtraOpts = [
                          "tpm2-device=auto"
                          "tpm2-with-pin=yes"
                        ];
                      };

                      content = {
                        type = "btrfs";
                        extraArgs = [ "-f" ];

                        subvolumes = {
                          "@" = {
                            mountpoint = "/";
                            mountOptions = [ "compress=zstd" ];
                          };

                          "@home" = {
                            mountpoint = "/home";
                            mountOptions = [ "compress=zstd" ];
                          };

                          "@nix" = {
                            mountpoint = "/nix";
                            mountOptions = [ "compress=zstd" ];
                          };

                          "@log" = {
                            mountpoint = "/var/log";
                            mountOptions = [ "compress=zstd" ];
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
    };
  };
}
