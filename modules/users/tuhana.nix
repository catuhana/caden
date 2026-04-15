{
  __findFile,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = {
          caden = {
            gnome = {
              shell = {
                settings = {
                  appearance = {
                    accent-colour = "slate";
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  den.aspects = {
    tuhana = {
      includes = [
        (<den/user-shell> "bash")
        <den/primary-user>

        <caden/gnome/shell>
        <caden/gnome/shell/extensions>
        <caden/gnome/shell/settings>

        <caden/programs/claude-desktop>
        <caden/programs/direnv>
        <caden/programs/gh>
        <caden/programs/git>
        <caden/programs/git/users/tuhana>
        <caden/programs/vscode>
      ];

      user = _: {
        description = "Tuhana GAYRETLİ";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow"
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
        ];
      };
    };
  };
}
