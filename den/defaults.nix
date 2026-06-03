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
              experimental-features = [
                "nix-command"
                "flakes"
                "cgroups"
                "auto-allocate-uids"
              ];

              use-cgroups = true;
              auto-allocate-uids = true;

              extra-substituters = [ "https://attic.xuyh0120.win/lantian" ];
              extra-trusted-public-keys = [
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
              ];
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
