{
  den,
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = {
          caden.gnome = {
            shell = {
              extensions = {
                blur-my-shell.enable = true;
                caffeine.enable = true;
                appindicator.enable = true;
                copyous.enable = true;
              };

              settings.appearance.accent-colour = "purple";
            };
          };
        };
      };
    };
  };

  den.aspects = {
    tuhana = {
      includes = [
        caden.gnome.shell
        caden.gnome.shell.extensions
        caden.gnome.shell.settings

        caden.programs.claude-desktop
        caden.programs.comma
        caden.programs.direnv
        caden.programs.gh
        caden.programs.git
        caden.programs.nh
        caden.programs.vscode
      ]
      ++ (
        builtins.attrValues {
          inherit (den.batteries)
            primary-user
            ;
        }
        ++ [
          (den.batteries.user-shell "bash")
        ]
      );

      user = _: {
        description = "Tuhana GAYRETLİ";

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
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow";
            signByDefault = true;
            format = "ssh";
          };
        };
      };
    };
  };
}
