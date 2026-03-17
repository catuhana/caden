{ den, caden, ... }:
{
  den.aspects.tuhana = {
    includes = [
      (den._.user-shell "zsh")

      caden.gnome._.gnome-extensions
      caden.gnome._.gnome-extensions._.blur-my-shell
      caden.gnome._.gnome-extensions._.caffeine
      caden.gnome._.gnome-extensions._.appindicator

      caden.gnome._.gnome-settings._.accent-colour._.purple
      caden.gnome._.gnome-settings._.wallpapers._.and-the-circus-leaves-town

      caden.programs._.zsh
      caden.programs._.zsh._.plugins._.zsh-autosuggestions
      caden.programs._.zsh._.plugins._.zsh-syntax-highlighting
      caden.programs._.zsh._.plugins._.zsh-mommy

      caden.programs._.gh
      caden.programs._.direnv
      caden.programs._.vscode
      caden.programs._.starship
      caden.programs._.git._.users._.tuhana
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
