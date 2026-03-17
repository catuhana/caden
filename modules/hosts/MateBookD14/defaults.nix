{ caden, ... }:
{
  den.hosts.x86_64-linux.MateBookD14 = {
    users.tuhana = { };
  };

  den.aspects.MateBookD14 = {
    nixos =
      { pkgs, ... }:
      {
        services.fwupd.enable = true;

        hardware = {
          enableAllFirmware = true;
          cpu.intel.updateMicrocode = true;
          graphics.extraPackages = [ pkgs.intel-media-driver ];
        };

        boot.kernelParams = [
          "xe.force_probe=46a6"
          "i915.force_probe=!46a6"
        ];

        system.stateVersion = "26.05";
      };

    includes =
      let
        inherit (caden)
          audio
          boot
          gnome
          locale
          networking
          programs
          security
          services
          time
          ;
      in
      [
        audio

        boot
        boot._.secure-boot
        boot._.silent-boot
        boot._.plymouth

        gnome

        locale._.tr_TR
        locale._.en_GB

        networking
        networking._.resolved
        networking._.resolved._.mdns
        networking._.dns._.cloudflare

        programs._.git
        programs._.msedit

        security._.apparmor
        security._.tpm2

        services._.flatpak
        services._.openssh
        services._.scx

        time
        time._.Istanbul
      ];
  };
}
