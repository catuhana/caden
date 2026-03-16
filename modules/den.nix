{ inputs, ... }:
{
  imports = [ (inputs.den.namespace "caden" false) ];
}
