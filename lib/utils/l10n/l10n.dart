import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Locale locale(BuildContext context) {
  return Localizations.localeOf(context);
}

String languageCode(BuildContext context) {
  return locale(context).languageCode;
}

String? countryCode(BuildContext context) {
  return locale(context).countryCode;
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
