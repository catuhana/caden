{ caden, ... }:
{
  caden.chassis.common = {
    includes = [
      caden.core.kmscon

      caden.services.openssh
    ];

    nixos = _: {
      services.fwupd.enable = true;
    };
  };
}
