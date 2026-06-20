{ pkgs, ... }:
{
  users.users.tuhana = {
    name = "tuhana";
    home = "/home/tuhana";
    isNormalUser = true;

    description = "Tuhana GAYRETLİ";

    shell = pkgs.bash;

    extraGroups = [
      "wheel"
      "networkmanager"
      "gamemode"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
    ];
  };

  programs.bash.enable = true;

  home-manager.users.tuhana = {
    imports = [
      ../../home-manager/programs/git.nix
      ../../home-manager/programs/vscode.nix
      ../../home-manager/programs/direnv.nix
      ../../home-manager/programs/gh.nix
      ../../home-manager/programs/msedit.nix
      ../../home-manager/programs/claude-desktop.nix
      ../../home-manager/gnome/shell.nix
    ];

    home = {
      username = "tuhana";
      homeDirectory = "/home/tuhana";
      stateVersion = "26.05";
    };

    programs.bash.enable = true;

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
}
