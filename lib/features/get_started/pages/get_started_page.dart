import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/config/router/app_router.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/core/storage/local_preferences_storage.dart';
import 'package:my_base_app/features/get_started/widgets/get_started_background_widget.dart';
import 'package:my_base_app/features/get_started/widgets/get_started_header_widget.dart';
import 'package:my_base_app/features/get_started/widgets/get_started_plant_image_widget.dart';
import 'package:my_base_app/features/get_started/widgets/get_started_terms_widget.dart';

@RoutePage()
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  void _onGetStarted() {
    final hasOpenedOnboarding =
        getIt<LocalPreferencesStorage>().getBool(
          AppConstants.hasOpenedOnboarding,
        ) ??
        false;

    if (hasOpenedOnboarding) {
      AppNavigation.replace(const DashboardRoute());
      return;
    }

    AppNavigation.replace(const OnboardingRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GetStartedBackgroundWidget(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.xl - AppDimensions.xxxs,
                    left: AppDimensions.lg,
                    right: AppDimensions.lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GetStartedHeaderWidget(),

                      const SizedBox(height: AppDimensions.xs),

                      Text(
                        context.appDictionary.get_started_subtitle,
                        style: context.appStyle.robotoReg16TextSecondary,
                      ),
                    ],
                  ),
                ),

                const Expanded(child: GetStartedPlantImageWidget()),

                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.lg,
                    right: AppDimensions.lg,
                    bottom: AppDimensions.xl + AppDimensions.xxs,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          key: const Key(AppConstants.getStartedButtonKey),
                          style: context.appStyle.elevatedPrimaryButtonStyle,
                          onPressed: _onGetStarted,
                          child: Text(context.appDictionary.get_started_button),
                        ),
                      ),

                      const SizedBox(height: AppDimensions.md),

                      const GetStartedTermsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
