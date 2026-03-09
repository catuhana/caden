{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.programs.zsh;
in
{
  options.tuhana.programs.zsh = {
    enable = mkEnableOption "ZSH" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.zsh.enable = true;
  };
}
