{
  den,
  caden,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = { };
      };
    };
  };

  den.aspects = {
    tuhana = {
      includes = [
        caden.gnome.shell

        caden.programs.direnv
        caden.programs.gh
        caden.programs.git
        caden.programs.msedit
        caden.programs.vscode

        caden.services.flatpak
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

        extraGroups = [ "gamemode" ];

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
        ];
      };

      homeManager =
        { pkgs, ... }:
        {
          programs.gnome-shell.extensions = map (package: { inherit package; }) (
            with pkgs.gnomeExtensions;
            [
              blur-my-shell
              caffeine
              appindicator
            ]
          );

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

          home.stateVersion = "26.05";
        };
    };
  };
}
