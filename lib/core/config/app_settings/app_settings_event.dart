import 'package:flutter/material.dart';

@immutable
abstract class AppSettingsEvent {
  const AppSettingsEvent();
}

class LoadAppSettingsEvent extends AppSettingsEvent {
  const LoadAppSettingsEvent();
}

class ChangeLanguageEvent extends AppSettingsEvent {
  final Locale locale;

  const ChangeLanguageEvent(this.locale);
}

class ToggleThemeEvent extends AppSettingsEvent {
  const ToggleThemeEvent();
}
