{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    ;

  cfg = config.tuhana.desktop;

  anyDesktopEnabled = cfg.gnome.enable;
in
{
  imports = [
    ./audio.nix
    ./flatpak.nix
    ./gnome.nix
  ];

  options.tuhana.desktop = {
    enable = mkEnableOption "desktop environment";
  };

  config = {
    assertions = [
      {
        assertion = cfg.enable -> anyDesktopEnabled;
        message = "tuhana.desktop.enable is true but no desktop environment is enabled.";
      }
    ];
  };
}
