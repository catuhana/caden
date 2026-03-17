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
          programs
          security
          services
          time
          ;
      in
      [
        audio

        boot
        boot.provides.secure-boot
        boot.provides.silent-boot
        boot.provides.plymouth

        gnome

        locale.provides.tr_TR
        locale.provides.en_GB

        programs.provides.git
        programs.provides.msedit

        security.provides.apparmor
        security.provides.tpm2

        services.provides.flatpak
        services.provides.openssh
        services.provides.scx

        time
        time.provides.Istanbul
      ];
  };
}
