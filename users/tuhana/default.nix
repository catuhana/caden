{ pkgs, inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.tuhana = {
    isNormalUser = true;
    description = "Tuhana GAYRETLİ";
    initialPassword = "meow";
    extraGroups = [
      "wheel"
      "networkmanager"
      "gamemode"
    ];
    shell = pkgs.bash;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
    ];
  };

  home-manager.users.tuhana = { pkgs, ... }: {
    home.stateVersion = "26.11";

    programs.git = {
      enable = true;
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

    programs.gh.enable = true;
    programs.direnv.enable = true;
    programs.vscode.enable = true;

    home.packages = [
      pkgs.msedit
      pkgs.google-chrome
    ];

    home.sessionVariables = {
      EDITOR = "edit";
      VISUAL = "edit";
    };

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
}
