{ pkgs }:
pkgs.mkShellNoCC {
  packages = [
    pkgs.sops
    pkgs.ssh-to-age

    pkgs.nixd
    pkgs.nixfmt
  ];
}
