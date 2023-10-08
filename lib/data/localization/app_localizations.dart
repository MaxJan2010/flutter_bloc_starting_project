import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  Locale? locale;
  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  late Map<String, String> localizationJsonStrings;

  Future loadLanguagesJson() async {
    String talks = await rootBundle
        .loadString('assets/json/localizations/${locale!.languageCode}.json');
    Map<String, dynamic> langsJson = json.decode(talks);
    localizationJsonStrings = langsJson.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => localizationJsonStrings[key] ?? "";
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale: locale);
    await appLocalizations.loadLanguagesJson();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
