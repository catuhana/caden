{
  den,
  caden,
  lib,
  ...
}:
{
  den.schema.host = {
    includes = [
      (den.lib.policy.when ({ host, ... }: host.chassis == "laptop") (
        _: den.lib.policy.include caden.chassis.laptop
      ))
    ];

    options.chassis = lib.mkOption {
      type = lib.types.enum [ "laptop" ];
    };
  };
}
