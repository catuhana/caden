{ inputs, ... }:
{
  caden.programs = {
    provides.comma = {
      homeManager = _: {
        imports = [ inputs.nix-index-database.homeModules.default ];

        programs.nix-index-database = {
          comma.enable = true;
        };
      };
    };
  };
}
