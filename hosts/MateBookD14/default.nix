{
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = { };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        caden.core.boot
        caden.core.boot.secure-boot
        caden.core.boot.silent-boot
        caden.core.boot.plymouth

        caden.core.nixos-init

        caden.core.networking
        caden.core.networking.mdns

        caden.core.security.tpm2

        caden.desktops.gnome

        caden.services.scx
        caden.services.userborn
        caden.services.usbmuxd

        caden.MateBookD14.quirks.power-limits
      ];

      nixos = _: {
        system.stateVersion = "26.11";
      };
    };
  };
}
