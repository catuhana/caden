{
  caden,
  lib,
  ...
}:
let
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
in
{
  den.hosts = lib.genAttrs systems (_: {
    Tabby = {
      wsl.enable = true;

      users.tuhana = { };
    };
  });

  den.aspects = {
    Tabby = {
      includes = [
        caden.chassis.wsl
      ];

      nixos = _: {
        system.stateVersion = "26.11";
      };
    };
  };
}
