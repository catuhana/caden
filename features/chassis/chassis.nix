{
  den,
  caden,
  lib,
  ...
}:
{
  den.schema.host =
    { config, ... }:
    {
      options.chassis = lib.mkOption {
        type = lib.types.enum [
          "laptop"
          "wsl"
        ];
      };

      config = {
        includes = [
          (den.lib.policy.when ({ host, ... }: host.chassis == "laptop") (
            _: den.lib.policy.include caden.chassis.laptop
          ))
          (den.lib.policy.when ({ host, ... }: host.chassis == "wsl") (
            _: den.lib.policy.include caden.chassis.wsl
          ))
        ];

        chassis = lib.mkIf config.wsl.enable (lib.mkDefault "wsl");
      };
    };
}
