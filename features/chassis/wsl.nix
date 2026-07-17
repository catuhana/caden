{ caden, lib, ... }:
{
  caden.chassis.wsl = {
    includes = [
      caden.core.documentation
      caden.programs.nix-ld
    ];
  };
}
