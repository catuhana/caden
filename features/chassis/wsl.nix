{ caden, lib, ... }:
{
  caden.chassis.wsl = {
    includes = [
      caden.core.documentation
      caden.core.etc-overlay

      caden.services.userborn
    ];

    nixos = _: {
      # Enabled by default for WSLg which I don't use.
      hardware.graphics.enable = lib.mkForce false;
    };
  };
}
