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
        den.batteries.hostname
        den.batteries.primary-user
      ];

      os = _: {
        nixpkgs.config.allowUnfree = true;
      };

      nixos =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          imports = [
            inputs.disko.nixosModules.default
            inputs.lanzaboote.nixosModules.lanzaboote

            # FIXME: Put this in a better place after re-install.
            {
              options.caden.reinstall = {
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
            }
          ];

          caden.reinstall = {
            # enable = true;

            gates = {
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

          assertions = lib.mapAttrsToList (name: gate: {
            assertion = config.caden.reinstall.enable -> gate.assertion;

            message = ''
              gate "${name}" was not satisfied
                host: ${config.networking.hostName}:
                  context: ${gate.description}
                  hint: ${gate.action}
            '';
          }) config.caden.reinstall.gates;

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
          };

          nix = {
            package = pkgs.lixPackageSets.latest.lix;

            settings = {
              auto-allocate-uids = true;
              auto-optimise-store = true;

              extra-substituters = [
                "https://nix-community.cachix.org"
              ];

              extra-trusted-public-keys = [
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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
