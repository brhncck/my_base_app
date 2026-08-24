import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_bloc.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_event.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

Future<void> showProfileLanguageSheet(
  BuildContext context,
  String currentCode,
) async {
  final selected = await showModalBottomSheet<String>(
    context: context,
    backgroundColor: context.appColorScheme.primaryBackgroundGradientEnd,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.md),
      ),
    ),
    builder: (_) => ProfileLanguageSheetWidget(currentCode: currentCode),
  );

  if (selected == null || selected == currentCode || !context.mounted) return;
  context.read<AppSettingsBloc>().add(ChangeLanguageEvent(Locale(selected)));
}

class ProfileLanguageSheetWidget extends StatelessWidget {
  final String currentCode;

  const ProfileLanguageSheetWidget({required this.currentCode, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppDimensions.xs),
          Container(
            width: AppDimensions.xl + AppDimensions.md,
            height: AppDimensions.xxs,
            decoration: BoxDecoration(
              color: context.appColorScheme.dashboardTabBarBorder,
              borderRadius: BorderRadius.circular(AppDimensions.md),
            ),
          ),
          const SizedBox(height: AppDimensions.sm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(context.appDictionary.profile_language_sheet_title),
            ),
          ),
          const SizedBox(height: AppDimensions.xs),
          _ProfileLanguageItemWidget(
            code: 'tr',
            title: context.appDictionary.profile_language_tr,
            currentCode: currentCode,
          ),
          _ProfileLanguageItemWidget(
            code: 'en',
            title: context.appDictionary.profile_language_en,
            currentCode: currentCode,
          ),
          const SizedBox(height: AppDimensions.xs),
        ],
      ),
    );
  }
}

class _ProfileLanguageItemWidget extends StatelessWidget {
  final String code;
  final String title;
  final String currentCode;

  const _ProfileLanguageItemWidget({
    required this.code,
    required this.title,
    required this.currentCode,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCode == code;

    return ListTile(
      onTap: () => Navigator.of(context).pop(code),
      title: Text(title),
      trailing: isSelected
          ? Icon(
              Icons.check,
              color: context.appColorScheme.primaryButtonBackgroundColor,
            )
          : null,
    );
  }
}
