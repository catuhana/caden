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
        den.batteries.define-user
        den.batteries.hostname
        den.batteries.inputs'
      ];

      os = _: {
        nixpkgs = {
          config.allowUnfree = true;
        };
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
              experimental-features = [
                "nix-command"
                "flakes"
                "cgroups"
                "auto-allocate-uids"
              ];

              auto-allocate-uids = true;
              auto-optimise-store = true;

              keep-going = true;
              use-cgroups = true;

              trusted-users = [ "@wheel" ];

              extra-substituters = [
                "https://nix-community.cachix.org"
              ];
              extra-trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              ];
            };
          };
        };
    };
  };
}
