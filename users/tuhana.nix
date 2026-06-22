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
        description = "Tuhana GAYRETLİ";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
          "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
        ];
      };

      homeManager =
        {
          config,
          lib,
          pkgs,
          ...
        }:
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

          caden.reinstall = {
            enable = true;

            gates = {
              update-state-version = {
                assertion = lib.mkDefault (config.home.stateVersion == lib.trivial.release);
                description = "`home.stateVersion` should match the current release";
                action = "bump `home.stateVersion` to ${lib.trivial.release}";
              };
            };
          };

          home.stateVersion = "26.11";
        };
    };
  };
}
