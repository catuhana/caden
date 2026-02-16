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

        <caden/security/apparmor>
        <caden/security/tpm2>

        <caden/services/flatpak>
        <caden/services/openssh>
        <caden/services/scx>

        <caden/time>
        <caden/time/Istanbul>
      ];

      nixos =
        { pkgs, ... }:
        {
          imports = [ inputs.disko.nixosModules.default ];

          services.fwupd.enable = true;

          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
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
                          bypassWorkqueues = true;
                          crypttabExtraOpts = [ "tpm2-device=auto" ];
                        };

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

                            "@nix" = {
                              mountpoint = "/nix";
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

                            "@swap" = {
                              mountpoint = "/swap";
                              swap = {
                                swapfile.size = "16G";
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

          system.stateVersion = "26.05";
        };
    };
  };
}
