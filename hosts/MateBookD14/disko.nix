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

        disko.devices = {
          disk = {
            main = {
              device = "/dev/nvme0n1";
              type = "disk";

              content = {
                type = "gpt";

                partitions = {
                  esp = {
                    type = "EF00";
                    size = "128M";

                    content = {
                      type = "filesystem";
                      format = "vfat";

                      mountpoint = "/efi";
                      mountOptions = [ "umask=0077" ];
                    };
                  };

                  boot = {
                    type = "EA00";
                    size = "1G";

                    content = {
                      type = "filesystem";
                      format = "vfat";

                      mountpoint = "/boot";
                      mountOptions = [ "umask=0077" ];
                    };
                  };

                  swap = {
                    size = "20G";

                    content = {
                      name = "swap";
                      type = "luks";

                      settings = {
                        allowDiscards = true;

                        crypttabExtraOpts = [
                          "tpm2-device=auto"
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
                      name = "root";
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
