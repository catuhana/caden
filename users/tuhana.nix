{ config, pkgs, ... }:
let
  kind = config.tuhana.system.kind;
in
{
  users.users.tuhana = {
    description = "Tuhana GAYRETLİ";

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow"
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
    ];
  };

  home-manager.users.tuhana = {
    imports = [
      ../modules/home-manager
    ];

    tuhana = {
      programs.vscode.enable = kind != "server";
      desktop.gnome.settings = {
        wallpaper = ../resources/wallpapers/tomb-raider.png;
        accentColour = "purple";
      };
    };

    home.stateVersion = "26.05";
  };
}
