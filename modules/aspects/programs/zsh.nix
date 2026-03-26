# TODO: Remove, I don't wanna use ZSH I think.
{
  __findFile ? __findFile,
  ...
}:
{
  caden.programs = {
    provides.zsh = {
      nixos = _: {
        programs.zsh.enable = true;
      };

      homeManager = _: {
        programs.zsh = {
          enable = true;

          autocd = true;
          enableVteIntegration = true;

          initContent = ''
            bindkey "^[[1;3C" forward-word # Alt+Right
            bindkey "^[[1;3D" backward-word # Alt+Left
          '';
        };
      };

      provides.plugins = {
        includes = [
          <caden/programs/zsh/plugins/zsh-autosuggestions>
          <caden/programs/zsh/plugins/zsh-syntax-highlighting>
          # <caden/programs/zsh/plugins/zsh-mommy>
        ];

        provides.zsh-autosuggestions = {
          homeManager = _: {
            programs.zsh.autosuggestion.enable = true;
          };
        };

        provides.zsh-syntax-highlighting = {
          homeManager = _: {
            programs.zsh.syntaxHighlighting.enable = true;
          };
        };

        # provides.zsh-mommy = {
        #   homeManager =
        #     { pkgs, ... }:
        #     let
        #       plugins = {
        #         zsh-mommy = {
        #           name = "zsh-mommy";
        #           file = "zsh-mommy.zsh";
        #           src = pkgs.fetchgit {
        #             url = "https://git.gay/tuhana/zsh-mommy";
        #             rev = "ae86075156725d841c93f02be5796f1f750fcb3c";
        #             sha256 = "sha256-YqbTUfasecyJrVdTEn07Ja09kyXyOSUqrtQsl/s255c=";
        #           };
        #         };
        #       };
        #     in
        #     {
        #       programs.zsh.plugins = [ plugins.zsh-mommy ];
        #     };
        # };
      };
    };
  };
}
