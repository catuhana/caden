{ lib, ... }:
{
  den.schema.host.options.desktop = lib.mkOption {
    type = lib.types.nullOr (lib.types.enum [ "gnome" ]);
    default = null;
  };
}
