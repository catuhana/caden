{ ... }:
{
  imports = [
    ../../modules/nixos/users/tuhana.nix

    ./hardware.nix
    ./disko.nix

    ../../modules/nixos/core/audio.nix

    ../../modules/nixos/core/boot
    ../../modules/nixos/core/boot/secure-boot.nix
    ../../modules/nixos/core/boot/silent-boot.nix
    ../../modules/nixos/core/boot/plymouth.nix

    ../../modules/nixos/core/documentation.nix

    ../../modules/nixos/core/locale.nix

    ../../modules/nixos/core/networking/resolved.nix
    ../../modules/nixos/core/networking/resolved-mdns.nix
    ../../modules/nixos/core/networking/dns-cloudflare.nix

    ../../modules/nixos/core/security/apparmor.nix
    ../../modules/nixos/core/security/tpm2.nix

    ../../modules/nixos/gnome/system.nix

    ../../modules/nixos/programs/gamemode.nix
    ../../modules/nixos/programs/gamescope.nix
    ../../modules/nixos/programs/nix-ld.nix

    ../../modules/nixos/services/bluetooth.nix
    ../../modules/nixos/services/flatpak.nix
    ../../modules/nixos/services/openssh.nix
    ../../modules/nixos/services/scx.nix
    ../../modules/nixos/services/thermald.nix
    ../../modules/nixos/services/userborn.nix
    ../../modules/nixos/services/usbmuxd.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "MateBookD14";

  caden.services.scx.scheduler = "scx_bpfland";

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

  home-manager.users.tuhana.caden.gnome.shell = {
    extensions = {
      blur-my-shell.enable = true;
      caffeine.enable = true;
      appindicator.enable = true;
    };
    settings.appearance.accent-colour = "purple";
  };
}
