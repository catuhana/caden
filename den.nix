{
  inputs,
  den,
  caden,
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

        caden.core.sops
        caden.core.reinstall
      ];

      os = _: {
        nixpkgs.config.allowUnfree = true;
      };

      nixos =
        {
          pkgs,
          ...
        }:
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
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
