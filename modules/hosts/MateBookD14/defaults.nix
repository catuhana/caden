{ caden, den, ... }:
{
  den.hosts.x86_64-linux.MateBookD14 = {
    users.tuhana = { };
  };

  den.aspects.MateBookD14.includes =
    let
      inherit (caden.core) boot;
    in
    [
      den.provides.hostname

      boot
    ];
}
