{
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        caden = {
          services.scx.scheduler = "scx_bpfland";
        };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        caden.core.audio

        caden.core.boot
        caden.core.boot.secure-boot
        caden.core.boot.silent-boot
        caden.core.boot.plymouth

        caden.core.documentation

        caden.core.hardware

        caden.core.locale

        caden.core.networking.resolved
        caden.core.networking.resolved.mdns
        caden.core.networking.dns.cloudflare

        caden.core.security.apparmor
        caden.core.security.tpm2

        caden.gnome
        caden.programs.gamemode
        caden.programs.gamescope
        caden.programs.nix-ld

        caden.services.bluetooth
        caden.services.flatpak
        caden.services.openssh
        caden.services.scx
        caden.services.thermald
        caden.services.userborn
        caden.services.usbmuxd
      ];

      nixos = _: {
        system.stateVersion = "26.05";

        systemd.services.raise-power-limits = {
          description = "Raise PL1 to the firmware PPCC maximum, as Intel DTT does on Windows";
          wantedBy = [
            "multi-user.target"
            "suspend.target"
          ];
          after = [ "suspend.target" ];
          before = [ "thermald.service" ];
          serviceConfig.Type = "oneshot";
          script = ''
            echo 40000000 > /sys/class/powercap/intel-rapl-mmio:0/constraint_0_power_limit_uw
            echo 40000000 > /sys/class/powercap/intel-rapl:0/constraint_0_power_limit_uw
          '';
        };
      };
    };
  };
}
