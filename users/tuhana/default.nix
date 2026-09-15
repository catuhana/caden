{
  den,
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana.classes = [ "homeManager" ];
      };
    };
  };

  den.aspects = {
    tuhana = {
      includes = [
        den.batteries.primary-user
        (den.batteries.user-shell "bash")

        caden.programs.direnv
        caden.programs.gh
        caden.programs.git
        caden.programs.msedit

        caden.programs.chrome-dev
        caden.programs.steam
        caden.programs.vscode

        caden.tuhana.identity
        caden.tuhana.git
        caden.tuhana.gnome

        # (den.lib.policy.when ({ host, ... }: (host.desktop or null) != null) (
        #   _: den.lib.policy.include caden.tuhana.graphical
        # ))

        # # `host.desktop` is sadly a workaround...
        # # can't have this in `caden.tuhana.graphical` for some reason...
        # (den.lib.policy.when ({ host, ... }: (host.desktop or null) == "gnome") (
        #   _: den.lib.policy.include caden.tuhana.gnome
        # ))
      ];
    };
  };
}
