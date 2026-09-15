_: {
  caden.MateBookD14.quirks = {
    power-limits = {
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
      };
    };
  };
}
