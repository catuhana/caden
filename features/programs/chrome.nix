_: {
  caden.programs = {
    chrome = {
      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.google-chrome
        ];
      };
    };
  };
}
