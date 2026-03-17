{ den, ... }:
{
  den.default = {
    includes = [
      den.provides.hostname
      den.provides.define-user
      den.provides.primary-user
    ];

    schema.user.classes = [ "homeManager" ];

    nixos =
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
  };
}
