{ cadenLib, pkgs, ... }:
let
  username = "tuhana";
in
{
  imports = [
    (cadenLib.mkHomeAlias username)
  ];

  users.users.${username} = {
    name = username;
    home = "/home/${username}";
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

  home-manager.users.${username} = {
    imports = [
      ../../../modules/home/programs/git.nix
      ../../../modules/home/programs/vscode.nix
      ../../../modules/home/programs/direnv.nix
      ../../../modules/home/programs/gh.nix
      ../../../modules/home/programs/msedit.nix
      ../../../modules/home/gnome/shell.nix
    ];

    home = {
      inherit username;
      homeDirectory = "/home/${username}";
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
