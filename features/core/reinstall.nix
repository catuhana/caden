_:
let
  mkReinstall =
    { label }:
    { config, lib, ... }:
    {
      options.caden = {
        reinstall = {
          enable = lib.mkEnableOption "re-install gates";

          gates = lib.mkOption {
            type = lib.types.attrsOf (
              lib.types.submodule {
                options = {
                  assertion = lib.mkOption {
                    type = lib.types.bool;
                  };

                  description = lib.mkOption {
                    type = lib.types.str;
                    default = "<no description>";
                  };

                  action = lib.mkOption {
                    type = lib.types.str;
                    default = "<no action>";
                  };
                };
              }
            );
            default = { };
          };
        };
      };

      config.assertions = lib.mapAttrsToList (name: gate: {
        assertion = config.caden.reinstall.enable -> gate.assertion;

        message = ''
          gate "${name}" was not satisfied
            ${label config}:
              context: ${gate.description}
              hint: ${gate.action}
        '';
      }) config.caden.reinstall.gates;
    };
in
{
  caden.core.reinstall = {
    nixos = mkReinstall { label = config': "host: ${config'.networking.hostName}"; };
    homeManager = mkReinstall { label = config': "user: ${config'.home.username}"; };
  };
}
