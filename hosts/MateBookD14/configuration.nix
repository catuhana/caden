{ hostName, ... }:
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
      networking.captiveBrowser.interface = "wlp0s20f3";

      security = {
        apparmor.enable = true;
        tpm2.enable = true;
      };
    };

    desktop.enable = true;
    desktop.gnome.enable = true;

    programs.nix-ld.enable = true;
  };

  networking.hostName = hostName;

  system.stateVersion = "26.05";
}
