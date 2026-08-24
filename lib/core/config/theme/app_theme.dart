import 'package:flutter/material.dart';
import 'package:my_base_app/core/config/theme/app_color_scheme.dart';
import 'package:my_base_app/core/config/theme/app_styles.dart';

class AppTheme {
  static ThemeData build(Brightness brightness) {
    final colorSchemeExtension = AppColorScheme.getColorScheme(brightness);
    final styles = AppStyles(colorSchemeExtension);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: colorSchemeExtension.primaryButtonBackgroundColor,
      brightness: brightness,
    ).copyWith(
      primary: colorSchemeExtension.primaryButtonBackgroundColor,
      onPrimary: colorSchemeExtension.primaryButtonForegroundColor,
      surface: colorSchemeExtension.primaryBackgroundGradientEnd,
      onSurface: colorSchemeExtension.textPrimary,
    );

    return ThemeData(
      useMaterial3: false,
      brightness: brightness,
      colorScheme: colorScheme,

      scaffoldBackgroundColor:
          colorSchemeExtension.primaryBackgroundGradientEnd,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: styles.elevatedPrimaryButtonStyle,
      ),

      extensions: <ThemeExtension<dynamic>>[
        colorSchemeExtension,
        styles,
      ],
    );
  }
}