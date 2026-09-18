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

        caden.programs.chrome
        caden.programs.steam
        caden.programs.vscode
        caden.programs.zed-editor

        caden.tuhana.git
        caden.tuhana.gnome
        caden.tuhana.identity
      ];
    };
  };
}
