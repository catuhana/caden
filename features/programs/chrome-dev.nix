_: {
  caden.programs = {
    chrome-dev = {
      homeManager = { pkgs, ... }: {
        home.packages = [
          pkgs.google-chrome
        ];
      };
    };
  };
}
