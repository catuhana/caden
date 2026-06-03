{
  den,
  inputs,
  ...
}:
{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
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
          overlays = [ inputs.claude-desktop.overlays.default ];
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
              experimental-features = [
                "nix-command"
                "flakes"
                "cgroups"
                "auto-allocate-uids"
              ];

              use-cgroups = true;
              auto-allocate-uids = true;
            };

            optimise.automatic = true;
          };

          system.stateVersion = "26.05";
        };

      homeManager = _: {
        home.stateVersion = "26.05";
      };
    };
  };
}
