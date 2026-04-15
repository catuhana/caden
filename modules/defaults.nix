{
  __findFile,
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
      includes = [
        <den/hostname>
        <den/define-user>
        <den/mutual-provider>
      ];

      os =
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;

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

    schema.user =
      { lib, ... }:
      {
        config = {
          classes = lib.mkDefault [ "homeManager" ];
        };
      };
  };
}
