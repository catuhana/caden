{ caden, lib, ... }:
{
  caden.chassis.wsl = {
    includes = [
      caden.core.documentation
    ];

    nixos = _: {
      # Enabled by default for WSLg which I don't use.
      hardware.graphics.enable = lib.mkForce false;
    };
  };
}
