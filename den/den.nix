{ inputs, ... }:
{
  imports = [
    inputs.den.flakeModule
    (inputs.den.namespace "caden" true)
  ];
}
