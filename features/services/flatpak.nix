{ inputs, ... }:
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

      homeManager = _: {
        imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

        services.flatpak = {
          enable = true;

          remotes = [
            {
              name = "flathub";
              location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
          ];
        };
      };
    };
  };
}
