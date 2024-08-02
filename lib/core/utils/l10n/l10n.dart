import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Locale localeOf(BuildContext context) {
  return Localizations.localeOf(context);
}

String languageCode(BuildContext context) {
  return localeOf(context).languageCode;
}

String? countryCode(BuildContext context) {
  return localeOf(context).countryCode;
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
