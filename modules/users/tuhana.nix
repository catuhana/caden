{ den, caden, ... }:
{
  den.aspects.tuhana = {
    includes = [
      (den.provides.user-shell "zsh")

      caden.gnome.provides.gnome-extensions
      caden.gnome.provides.gnome-extensions.provides.blur-my-shell
      caden.gnome.provides.gnome-extensions.provides.caffeine
      caden.gnome.provides.gnome-extensions.provides.appindicator

      caden.gnome.provides.gnome-settings.provides.accent-colour.provides.purple
      caden.gnome.provides.gnome-settings.provides.wallpapers.provides.and-the-circus-leaves-town

      caden.programs.provides.zsh
      caden.programs.provides.zsh.provides.plugins.provides.zsh-autosuggestions
      caden.programs.provides.zsh.provides.plugins.provides.zsh-syntax-highlighting
      caden.programs.provides.zsh.provides.plugins.provides.zsh-mommy

      caden.programs.provides.gh
      caden.programs.provides.direnv
      caden.programs.provides.vscode
      caden.programs.provides.git.provides.users.provides.tuhana
    ];

    nixos.users.users.tuhana = {
      description = "Tuhana GAYRETLİ";

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow"
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
      ];
    };

    homeManager.home.stateVersion = "26.05";
  };
}
