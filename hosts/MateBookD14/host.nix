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

        caden.core.networking.resolved
        caden.core.networking.resolved.mdns
        caden.core.networking.dns.cloudflare

        caden.core.security.tpm2

        caden.gnome
        caden.programs.gamemode
        caden.programs.steam

        caden.services.bluetooth
        caden.services.flatpak
        caden.services.openssh
        caden.services.scx
        caden.services.thermald
        caden.services.userborn
        caden.services.usbmuxd
      ];

      nixos =
        { config, lib, ... }:
        {
          system.stateVersion = "26.05";

          sops.secrets."users/tuhana/hashed-password".neededForUsers = true;
          users.users.tuhana.hashedPasswordFile = config.sops.secrets."users/tuhana/hashed-password".path;

          caden.reinstall = {
            # enable = true;

            gates = {
              enable-aspect-nixos-init = {
                assertion = config.system.nixos-init.enable or false;
                description = "`caden.core.nixos-init` should be enabled";
              };

              update-state-version = {
                assertion = lib.mkDefault (config.system.stateVersion == config.system.nixos.release);
                description = "`system.stateVersion` should match the current release";
                action = "bump `system.stateVersion` to ${config.system.nixos.release}";
              };
            };
          };

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
