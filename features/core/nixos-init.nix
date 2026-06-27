{ caden, ... }:
{
  caden.core = {
    nixos-init = {
      includes = [
        caden.core.etc-overlay
      ];

      nixos = _: {
        system.nixos-init.enable = true;
      };
    };
  };
}
