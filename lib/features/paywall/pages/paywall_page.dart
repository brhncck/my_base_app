import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/common/widget/modal_close_button_widget.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/paywall/widgets/paywall_features_widget.dart';
import 'package:my_base_app/features/paywall/widgets/paywall_header_text_widget.dart';
import 'package:my_base_app/features/paywall/widgets/paywall_plans_widget.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  final double _designImageWidth = 360;
  final double _designImageHeight = 466;
  final double _regularTitleTopRatio = 0.34;
  final double _compactTitleTopRatio = 0.32;
  final double _smallTitleTopRatio = 0.28;
  final double _compactHeight = 900;
  final double _smallHeight = 760;

  double get _imageHeightRatio => _designImageHeight / _designImageWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColorScheme.paywallBackground,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final imageHeight = constraints.maxWidth * _imageHeightRatio;
          final isCompact = constraints.maxHeight <= _compactHeight;
          final isSmall = constraints.maxHeight <= _smallHeight;
          final titleTop =
              constraints.maxHeight *
              (isSmall
                  ? _smallTitleTopRatio
                  : isCompact
                  ? _compactTitleTopRatio
                  : _regularTitleTopRatio);
          final headerBottomSpacing = isSmall
              ? AppDimensions.xs
              : isCompact
              ? AppDimensions.sm
              : AppDimensions.md;
          final sectionSpacing = isSmall
              ? AppDimensions.sm
              : isCompact
              ? AppDimensions.lg
              : AppDimensions.xl;
          final footerButtonSpacing = AppDimensions.sm - AppDimensions.xxxs;
          final footerLinksSpacing = AppDimensions.xs;
          final pageBottomSpacing = isSmall
              ? AppDimensions.sm
              : AppDimensions.lg;

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: imageHeight,
                child: Image.asset(AppAssets.paywallImage, fit: BoxFit.cover),
              ),

              Positioned.fill(
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: pageBottomSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: titleTop),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.lg,
                          ),
                          child: PaywallHeaderTextWidget(),
                        ),
                        SizedBox(height: headerBottomSpacing),
                        const PaywallFeaturesWidget(),
                        SizedBox(height: sectionSpacing),
                        const PaywallPlansWidget(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.lg,
                          ),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: AppNavigation.pop,
                                style:
                                    context.appStyle.elevatedPrimaryButtonStyle,
                                child: Text(
                                  context.appDictionary.paywall_try_free_button,
                                ),
                              ),
                              SizedBox(height: footerButtonSpacing),
                              Text(
                                context.appDictionary.paywall_trial_note,
                                textAlign: TextAlign.center,
                                style: context.appStyle.robotoLight9WhiteMuted,
                              ),
                              SizedBox(height: footerLinksSpacing),
                              Text(
                                '${context.appDictionary.paywall_terms}  •  ${context.appDictionary.paywall_privacy}  •  ${context.appDictionary.paywall_restore}',
                                textAlign: TextAlign.center,
                                style: context.appStyle.robotoReg11WhiteMuted,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SafeArea(
                bottom: false,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.sm + AppDimensions.xxs,
                      right: AppDimensions.lg,
                    ),
                    child: ModalCloseButtonWidget(
                      key: const Key(AppConstants.paywallCloseButtonKey),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
