import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_bloc.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_event.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_state.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/profile/widgets/profile_language_sheet_widget.dart';
import 'package:my_base_app/features/profile/widgets/profile_tiles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: const Key(AppConstants.profilePageKey),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: AppDimensions.xs),
          Column(
            children: [
              BlocSelector<AppSettingsBloc, AppSettingsState, bool>(
                selector: (state) => state.isDarkMode,
                builder: (context, isDark) {
                  return ProfileTile(
                    icon: Icons.dark_mode,
                    title: context.appDictionary.profile_dark_mode,
                    trailing: Switch.adaptive(
                      key: const Key(AppConstants.profileThemeSwitchKey),
                      value: isDark,
                      onChanged: (_) {
                        context.read<AppSettingsBloc>().add(
                          const ToggleThemeEvent(),
                        );
                      },
                      activeTrackColor:
                          context.appColorScheme.primaryButtonBackgroundColor,
                      inactiveThumbColor: context.appColorScheme.textMuted,
                      inactiveTrackColor:
                          context.appColorScheme.pageIndicatorInactiveColor,
                    ),
                  );
                },
              ),
              BlocSelector<AppSettingsBloc, AppSettingsState, String>(
                selector: (state) => state.settings.languageCode,
                builder: (context, code) {
                  final label = code == 'tr'
                      ? context.appDictionary.profile_language_tr
                      : context.appDictionary.profile_language_en;

                  return ProfileTile(
                    icon: Icons.translate,
                    title: context.appDictionary.profile_language,
                    onTap: () => showProfileLanguageSheet(context, code),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(label),
                        const SizedBox(width: AppDimensions.xs),
                        Icon(
                          Icons.chevron_right,
                          color: context.appColorScheme.textMuted,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
