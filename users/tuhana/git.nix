_: {
  caden.tuhana = {
    git = {
      homeManager = _: {
        programs.git = {
          settings = {
            init.defaultBranch = "main";

            user = {
              name = "tuhana";
              email = "tuhana.cat+git@gmail.com";
            };

            gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
          };

          signing = {
            signByDefault = true;

            format = "ssh";
            key = "~/.ssh/id_ed25519.pub";
          };
        };

        home.stateVersion = "26.11";
      };
    };
  };
}
