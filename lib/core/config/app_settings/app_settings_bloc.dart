import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/core/config/app_settings.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_event.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_state.dart';
import 'package:my_base_app/core/storage/local_preferences_storage.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final LocalPreferencesStorage _storage;

  static const String _defaultLanguageCode = 'en';
  static const String _lightThemeMode = 'light';
  static const String _darkThemeMode = 'dark';

  AppSettingsBloc({required LocalPreferencesStorage storage})
    : _storage = storage,
      super(
        const AppSettingsState(
          settings: AppSettings(
            languageCode: _defaultLanguageCode,
            themeMode: _lightThemeMode,
          ),
        ),
      ) {
    on<LoadAppSettingsEvent>(_onLoadAppSettings);
    on<ChangeLanguageEvent>(_onChangeLanguage);
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  Future<void> _onLoadAppSettings(
    LoadAppSettingsEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    emit(state.copyWith(settings: _loadSettings()));
  }

  Future<void> _onChangeLanguage(
    ChangeLanguageEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    final settings = AppSettings(
      languageCode: event.locale.languageCode,
      themeMode: state.settings.themeMode,
    );

    emit(state.copyWith(settings: settings));
    await _saveSettings(settings);
  }

  Future<void> _onToggleTheme(
    ToggleThemeEvent event,
    Emitter<AppSettingsState> emit,
  ) async {
    final nextThemeMode = state.themeMode == ThemeMode.dark
        ? _lightThemeMode
        : _darkThemeMode;
    final settings = AppSettings(
      languageCode: state.settings.languageCode,
      themeMode: nextThemeMode,
    );

    emit(state.copyWith(settings: settings));
    await _saveSettings(settings);
  }

  AppSettings _loadSettings() {
    final value = _storage.getString(AppConstants.appSettings);
    if (value == null || value.isEmpty) return _defaultSettings;

    try {
      final json = jsonDecode(value);
      if (json is Map<String, dynamic>) return AppSettings.fromJson(json);
      if (json is Map) {
        return AppSettings.fromJson(Map<String, dynamic>.from(json));
      }
    } catch (_) {
      return _defaultSettings;
    }

    return _defaultSettings;
  }

  Future<void> _saveSettings(AppSettings settings) {
    return _storage.setString(
      AppConstants.appSettings,
      jsonEncode(settings.toJson()),
    );
  }

  AppSettings get _defaultSettings {
    return const AppSettings(
      languageCode: _defaultLanguageCode,
      themeMode: _lightThemeMode,
    );
  }
}
