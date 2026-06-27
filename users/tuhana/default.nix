{
  den,
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = { };
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

        (den.lib.policy.when ({ host, ... }: (host.desktop or null) != null) (
          _: den.lib.policy.include caden.tuhana.graphical
        ))

        # `host.desktop` is sadly a workaround...
        # can't have this in `caden.tuhana.graphical` for some reason...
        (den.lib.policy.when ({ host, ... }: (host.desktop or null) == "gnome") (
          _: den.lib.policy.include caden.tuhana.gnome
        ))
      ];

      user = _: {
        description = "Tuhana GAYRETLİ";

        initialPassword = "meow";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
        ];
      };

      homeManager = _: {
        programs.git = {
          settings = {
            init.defaultBranch = "main";

            user = {
              name = "tuhana";
              email = "tuhana.cat+git@gmail.com";
            };
          };

          signing = {
            signByDefault = true;

            format = "ssh";
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow";
          };
        };

        home.stateVersion = "26.11";
      };
    };
  };
}
