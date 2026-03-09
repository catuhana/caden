{ ... }:
{
  imports = [
    ./core/boot.nix
    ./core/locale.nix
    ./core/networking.nix
    ./core/nix.nix
    ./core/security.nix
    ./core/swap.nix
    ./core/system.nix

    ./desktop

    ./programs/git.nix
    ./programs/msedit.nix
    ./programs/zsh.nix

    ./services/home-manager.nix
    ./services/openssh.nix
    ./services/scx.nix
  ];
}
