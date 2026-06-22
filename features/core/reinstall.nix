_: {
  caden.core.reinstall = {
    nixos =
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

        config = {
          assertions = lib.mapAttrsToList (name: gate: {
            assertion = config.caden.reinstall.enable -> gate.assertion;

            message = ''
              gate "${name}" was not satisfied
                host: ${config.networking.hostName}:
                  context: ${gate.description}
                  hint: ${gate.action}
            '';
          }) config.caden.reinstall.gates;

          caden.reinstall.gates = {
            enable-aspect-nixos-init = {
              assertion = config.system.nixos-init.enable or false;
              description = "`caden.core.nixos-init` should be enabled";
            };

            update-state-versions = {
              assertion = lib.mkDefault (
                config.system.stateVersion == config.system.nixos.release
                && lib.all (user: user.home.stateVersion == config.system.nixos.release) (
                  lib.attrValues config.home-manager.users
                )
              );
              description = "`{system,home}.stateVersion` should match the current release";
              action = "bump `{system,home}.stateVersion` to ${config.system.nixos.release}";
            };
          };
        };
      };
  };
}
