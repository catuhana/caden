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

        caden.programs.chrome-dev
        caden.programs.direnv
        caden.programs.gh
        caden.programs.git
        caden.programs.msedit
        caden.programs.vscode

        caden.services.flatpak

        caden.programs.flatpak.anydesk
        caden.programs.flatpak.bottles
        caden.programs.flatpak.fractal
        caden.programs.flatpak.galaxy-buds-client
        caden.programs.flatpak.libreoffice
        caden.programs.flatpak.nicotine
        caden.programs.flatpak.obs-studio
        caden.programs.flatpak.obsidian
        caden.programs.flatpak.picard
        caden.programs.flatpak.plume-impactor
        caden.programs.flatpak.protonvpn

        (den.lib.policy.when ({ host, ... }: host.hasAspect caden.desktops.gnome) caden.tuhana.gnome)
      ];

      user = _: {
        initialPassword = "meowmrrp";

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
            signByDefault = true;

            format = "ssh";
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow";
          };
        };

        home.stateVersion = "26.11";
      };
    };
  };

  caden.tuhana = {
    gnome = _: {
      homeManager =
        {
          pkgs,
          ...
        }:
        {
          programs.gnome-shell = {
            enable = true;

            extensions = map (package: { inherit package; }) (
              with pkgs.gnomeExtensions;
              [
                blur-my-shell
                caffeine
                appindicator
              ]
            );
          };
        };
    };
  };
}
