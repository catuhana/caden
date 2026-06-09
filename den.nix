{
  inputs,
  den,
  ...
}:
{
  imports = [
    (inputs.den.namespace "caden" true)
  ];

  den = {
    default = {
      includes = builtins.attrValues {
        inherit (den.batteries)
          hostname
          define-user
          ;
      };

      os = _: {
        nixpkgs = {
          config.allowUnfree = true;

          overlays = [
            inputs.claude-desktop.overlays.default
            inputs.nix-cachyos-kernel.overlays.pinned
          ];
        };
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
          };

          nix = {
            package = pkgs.lixPackageSets.latest.lix;

            settings = {
              auto-allocate-uids = true;
              auto-optimise-store = true;

              extra-substituters = [
                "https://nix-community.cachix.org"
                "https://attic.xuyh0120.win/lantian"
              ];

              extra-trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
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
