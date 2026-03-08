{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib)
    mkIf
    mkOption
    mkEnableOption
    types
    strings
    ;

  cfg = config.tuhana.desktop.gnome;

  hostGnomeEnabled = osConfig.tuhana.desktop.gnome.enable or false;
in
{
  options.tuhana.desktop.gnome = {
    enable = mkEnableOption "GNOME" // {
      default = hostGnomeEnabled;
    };

    settings = {
      wallpaper = mkOption {
        type = types.nullOr (
          types.oneOf [
            types.path
            types.package
            types.url
          ]
        );
        default = null;
      };

      accentColour = mkOption {
        type = types.nullOr (
          types.enum [
            "blue"
            "teal"
            "green"
            "yellow"
            "orange"
            "red"
            "pink"
            "purple"
            "slate"
          ]
        );
        default = "blue";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.gnome-shell = {
      enable = true;

      extensions = with pkgs.gnomeExtensions; [
        { package = blur-my-shell; }
        { package = caffeine; }
        { package = appindicator; }
        { package = just-perfection; }
        { package = unite; }
      ];
    };

    dconf.settings = {
      "org/gnome/desktop/background" =
        let
          toFileURI =
            path:
            let
              str =
                if builtins.isString path then
                  builtins.replaceStrings [ "%2F" ] [ "/" ] (strings.escapeURL path)
                else
                  path;
            in
            "file://${str}";
        in
        mkIf (cfg.settings.wallpaper != null) {
          picture-uri = toFileURI cfg.settings.wallpaper;
          picture-uri-dark = toFileURI cfg.settings.wallpaper;
        };

      "org/gnome/desktop/datetime" = {
        automatic-timezone = true;
      };

      "org/gnome/desktop/interface" = {
        accent-color = cfg.settings.accentColour;
        clock-show-weekday = true;
        show-battery-percentage = true;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        two-finger-scrolling-enabled = true; # TODO: This might be the default? Check it.
      };
    };
  };
}
