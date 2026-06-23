{ caden, ... }:
{
  caden.chassis.common = {
    includes = [
      caden.services.openssh
    ];

    nixos = _: {
      services.fwupd.enable = true;
    };
  };
}
