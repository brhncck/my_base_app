import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/core/config/app_settings.dart';

class AppSettingsState extends Equatable {
  final AppSettings settings;

  const AppSettingsState({required this.settings});

  Locale get locale => Locale(settings.languageCode);

  ThemeMode get themeMode {
    return settings.themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;

  AppSettingsState copyWith({AppSettings? settings}) {
    return AppSettingsState(settings: settings ?? this.settings);
  }

  @override
  List<Object?> get props => [settings.languageCode, settings.themeMode];
}
