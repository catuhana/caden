{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  tuhana = {
    core = {
      boot = {
        secureBoot.enable = true;
        silentBoot.enable = true;
        plymouth.enable = true;
      };

      locale.timeZone = "Europe/Istanbul";

      networking.resolved.mDNS = true;

      security = {
        apparmor.enable = true;
        tpm2.enable = true;
      };
    };

    desktop.enable = true;
    desktop.gnome.enable = true;

    services.openssh.enable = true;
  };

  system.stateVersion = "26.05";
}
