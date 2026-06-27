{
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        desktop = "gnome";

        scx.scheduler = "scx_bpfland";

        users.tuhana = { };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        caden.chassis.laptop

        caden.core.boot
        caden.core.boot.secure-boot
        caden.core.boot.silent-boot
        caden.core.boot.plymouth

        caden.core.documentation

        caden.core.nixos-init

        caden.core.networking
        caden.core.networking.mdns

        caden.core.security.tpm2

        caden.desktops.gnome

        caden.programs.gamemode

        caden.services.flatpak
        caden.services.scx
        caden.services.userborn
        caden.services.usbmuxd
      ];

      nixos = _: {
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

        system.stateVersion = "26.11";
      };
    };
  };
}
