{
  inputs,
  den,
  ...
}:
{
  imports = [
    (inputs.den.namespace "caden" false)
  ];

  den = {
    default = {
      includes = [
        den.batteries.hostname
        den.batteries.primary-user
      ];

      os = _: {
        nixpkgs.config.allowUnfree = true;
      };

      nixos =
        { pkgs, ... }:
        {
          imports = [
            inputs.disko.nixosModules.default
            inputs.lanzaboote.nixosModules.lanzaboote
          ];

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
          };

          nix = {
            package = pkgs.lixPackageSets.latest.lix;

            settings = {
              auto-allocate-uids = true;
              auto-optimise-store = true;

              extra-substituters = [
                "https://nix-community.cachix.org"
              ];

              extra-trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              ];

              keep-going = true;

              trusted-users = [ "@wheel" ];

              use-cgroups = true;
              use-xdg-base-directories = true;

              experimental-features = [
                "nix-command"
                "flakes"
                "cgroups"
                "auto-allocate-uids"
              ];
            };
          };
        };
    };

    schema = {
      user =
        { lib, ... }:
        {
          config = {
            classes = lib.mkDefault [ "homeManager" ];
          };
        };
    };
  };
}
