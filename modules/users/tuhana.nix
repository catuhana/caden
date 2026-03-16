{
  inputs,
  den,
  caden,
  ...
}:
{
  den.aspects.tuhana = {
    includes = [ (den.provides.user-shell "zsh") ];
  };
}
