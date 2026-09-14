{ pkgs }:
{
  default = pkgs.mkShellNoCC {
    packages = [
      pkgs.nixd
      pkgs.nixfmt
    ];
  };
}
