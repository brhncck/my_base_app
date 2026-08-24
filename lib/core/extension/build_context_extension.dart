import 'package:flutter/material.dart';
import 'package:my_base_app/core/config/theme/app_color_scheme.dart';
import 'package:my_base_app/core/config/theme/app_styles.dart';
import 'package:my_base_app/l10n/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppStyles get appStyle => theme.appStyle;
  AppColorScheme get appColorScheme => theme.appColorScheme;
  AppLocalizations get appDictionary => AppLocalizations.of(this)!;
}

extension ThemeDataExtensions on ThemeData {
  AppStyles get appStyle =>
      extension<AppStyles>() ??
      AppStyles(AppColorScheme.getColorScheme(brightness));
  AppColorScheme get appColorScheme =>
      extension<AppColorScheme>() ?? AppColorScheme.getColorScheme(brightness);
}
