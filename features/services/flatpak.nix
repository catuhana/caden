{ inputs, ... }:
{
  caden.services = {
    flatpak = {
      nixos = _: {
        services.flatpak.enable = true;
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
