{ caden, ... }:
{
  caden.chassis.laptop = {
    includes = [
      caden.chassis.common

      caden.services.bluetooth
      caden.services.thermald
    ];

    nixos = _: {
      networking.networkmanager.enable = true;

      services = {
        power-profiles-daemon.enable = true;
        upower.enable = true;
      };
    };
  };
}
