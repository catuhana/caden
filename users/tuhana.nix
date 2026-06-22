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
        den.batteries.primary-user
        (den.batteries.user-shell "bash")

        caden.programs.direnv
        caden.programs.gh
        caden.programs.git
        caden.programs.msedit
        caden.programs.vscode

        caden.services.flatpak

        caden.programs.flatpak.anydesk
        caden.programs.flatpak.bottles
        caden.programs.flatpak.chrome
        caden.programs.flatpak.fractal
        caden.programs.flatpak.galaxy-buds-client
        caden.programs.flatpak.libreoffice
        caden.programs.flatpak.nicotine
        caden.programs.flatpak.obs-studio
        caden.programs.flatpak.obsidian
        caden.programs.flatpak.picard
        caden.programs.flatpak.plume-impactor
        caden.programs.flatpak.protonvpn
        caden.programs.flatpak.signal
      ];

      user = _: {
        initialPassword = "meowmrrp";

        description = "Tuhana GAYRETLİ";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
        ];
      };

      homeManager =
        { pkgs, ... }:
        {
          # FIXME: Move this to GNOME aspect since it is GNOME-specific,
          # or figure out a way to enable this only when GNOME aspect is
          # enabled. Why I removed it from the aspect in the first place
          # is that it's a user-specific thing. I may be stupid, and I am,
          # and I still don't get how I should manage those things. I'm
          # getting tired. I really want to like NixOS but some stuff just
          # tickles a part of my stupid brain. But I also like NixOS, so
          # I guess I will. I don't fucking know at this point. I just know
          # that I want to have a fully declarative setup, but my stupid
          # perfectionist brain just can't decide what the fuck to do.
          # Whatever. I hope I won't end up installing Windows. I really
          # don't want to. Or I guess I'll just install ParticleOS or
          # GNOME OS, which are, in my opinion, how a distribution should
          # be. Even the LLMs seem to suck at designing something that
          # fits in my brain that I myself can't design. I'm so fucking
          # lost. Whatever.
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

          home.stateVersion = "26.11";
        };
    };
  };
}
