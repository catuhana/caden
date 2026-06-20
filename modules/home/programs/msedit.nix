{ pkgs, ... }:
{
  home = {
    packages = [ pkgs.msedit ];

    sessionVariables = {
      EDITOR = "edit";
      VISUAL = "edit";
    };
  };
}
