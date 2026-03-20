{
  caden.locale = {
    nixos.i18n.defaultLocale = "en_GB.UTF-8";

    provides.tr_TR.nixos = {
      i18n.extraLocales = [ "tr_TR.UTF-8/UTF-8" ];
    };
  };
}
