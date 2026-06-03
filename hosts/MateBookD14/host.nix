{
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        caden = {
          services.scx.scheduler = "scx_lavd";
        };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        caden.core.audio

        caden.core.boot
        caden.core.boot.secure-boot
        caden.core.boot.silent-boot
        caden.core.boot.plymouth

        caden.core.locale
        # Remove this, enable all languages and let the user
        # pick the one they want in the DE or wherever.
        caden.core.locale.tr_TR

        caden.core.networking.resolved
        caden.core.networking.resolved.mdns
        caden.core.networking.dns.cloudflare

        caden.core.security.apparmor
        caden.core.security.tpm2

        caden.gnome
        caden.programs.nix-ld

        caden.services.flatpak
        caden.services.openssh
        caden.services.scx
        caden.services.thermald
        caden.services.userborn
        caden.services.usbmuxd
      ];
    };
  };
}
