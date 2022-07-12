def language_info(lang)
  {
    en: {
      name: t(:english),
      flag: "🇺🇸"
    },
    es: {
      name: t(:spanish),
      flag: "🇪🇸"
    }
  }[lang.to_s.to_sym]
end