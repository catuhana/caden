_: {
  caden.programs = {
    provides.git = {
      homeManager = _: {
        programs.git.enable = true;
      };

      provides.users = {
        provides.tuhana = {
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
          };
        };
      };
    };
  };
}
