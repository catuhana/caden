{ pkgs }:
pkgs.mkShellNoCC {
  packages = [
    pkgs.nixd
    pkgs.nixfmt
  ];
}
