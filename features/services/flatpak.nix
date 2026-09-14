_:
{
  caden.services = {
    flatpak = {
      nixos =
        { pkgs, ... }:
        {
          services.flatpak.enable = true;

          xdg.portal = {
            enable = true;

            extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

            config.common.default = [ "gtk" ];
          };
        };
    };
  };
}
