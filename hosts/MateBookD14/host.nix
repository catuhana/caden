_: {
  imports = [
    ./hardware.nix
    ./disko.nix

    ../../users/tuhana/default.nix

    ../../features/core/boot/default.nix
    ../../features/core/boot/secure-boot.nix
    ../../features/core/boot/silent-boot.nix
    ../../features/core/boot/plymouth.nix

    ../../features/core/nixos-init.nix
    ../../features/core/etc-overlay.nix

    ../../features/core/networking/default.nix
    ../../features/core/networking/mdns.nix

    ../../features/core/security/tpm2.nix

    ../../features/desktops/gnome.nix

    ../../features/programs/gamemode.nix
    ../../features/programs/steam.nix

    ../../features/services/scx.nix
    ../../features/services/userborn.nix
    ../../features/services/usbmuxd.nix
  ];

  scx.scheduler = "scx_bpfland";

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
}
