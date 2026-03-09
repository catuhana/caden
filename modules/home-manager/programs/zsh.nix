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
    mkEnableOption
    ;

  cfg = config.tuhana.programs.zsh;
in
{
  options.tuhana.programs.zsh = {
    enable = mkEnableOption "ZSH" // {
      default = osConfig.tuhana.programs.zsh.enable;
    };
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;

        autocd = true;
        enableVteIntegration = true;

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        plugins = [
          {
            name = "zsh-mommy";
            file = "zsh-mommy.zsh";
            # git.gay disables archive downloads for some reason.
            src = pkgs.fetchgit {
              url = "https://git.gay/tuhana/zsh-mommy";
              rev = "ae86075156725d841c93f02be5796f1f750fcb3c";
              sha256 = "sha256-YqbTUfasecyJrVdTEn07Ja09kyXyOSUqrtQsl/s255c=";
            };
          }
        ];

        initContent = ''
          bindkey "^[[1;3C" forward-word # Alt+Right
          bindkey "^[[1;3D" backward-word # Alt+Left
        '';
      };

      starship.enable = true;
    };
  };
}
