{
  __findFile ? __findFile,
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
      ];

      os =
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;

          nix = {
            package = pkgs.lixPackageSets.stable.lix;

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
        };

      homeManager.nixpkgs.config.allowUnfree = true;
    };

    schema.user =
      { lib, ... }:
      {
        config.classes = lib.mkDefault [ "homeManager" ];
      };
  };
}
