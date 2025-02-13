import 'package:flutter/cupertino.dart';
import 'package:hh_refresh/l10n/app_localizations.dart';

extension AppStrings on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}