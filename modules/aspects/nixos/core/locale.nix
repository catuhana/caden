_: {
  caden.locale = {
    nixos = _: {
      i18n = {
        defaultLocale = "en_GB.UTF-8";
      };
    };

    provides.tr_TR = {
      nixos = _: {
        i18n.extraLocales = [ "tr_TR.UTF-8/UTF-8" ];
      };
    };
  };
}
