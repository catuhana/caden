{
  mkShellNoCC,
  nixd,
  nixfmt,

  ...
}:
{
  default = mkShellNoCC {
    packages = [
      nixd
      nixfmt
    ];
  };
}
