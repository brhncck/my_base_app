import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/config/router/app_router.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/core/storage/local_preferences_storage.dart';
import 'package:my_base_app/features/onboarding/widgets/onboarding_image_widget.dart';
import 'package:my_base_app/features/onboarding/widgets/onboarding_page_indicator_widget.dart';
import 'package:my_base_app/features/onboarding/widgets/onboarding_title_widget.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final int _itemCount = 2;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Curve _animationCurve = Curves.easeOut;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _cacheOnboardingOpened();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _cacheOnboardingOpened() {
    unawaited(
      getIt<LocalPreferencesStorage>().setBool(
        AppConstants.hasOpenedOnboarding,
        true,
      ),
    );
  }

  void _onContinue() {
    if (_currentIndex < _itemCount - 1) {
      _pageController.nextPage(
        duration: _animationDuration,
        curve: _animationCurve,
      );
      return;
    }

    AppNavigation.replace(const DashboardRoute());
  }

  @override
  Widget build(BuildContext context) {
    final dictionary = context.appDictionary;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.xl - AppDimensions.xxxs,
            bottom: AppDimensions.xl,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingTitleWidget(
                            margin: EdgeInsets.only(
                              left: AppDimensions.lg,
                              right: AppDimensions.lg,
                            ),
                            prefixText:
                                dictionary.onboarding_first_title_prefix,
                            highlightText:
                                dictionary.onboarding_first_title_highlight,
                            suffixText:
                                dictionary.onboarding_first_title_suffix,
                            lineBreakAfterHighlightText: true,
                          ),
                          const SizedBox(height: AppDimensions.xxl),
                          const Expanded(
                            child: OnboardingImageWidget(
                              assetPath: AppAssets.onboardingFirst,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingTitleWidget(
                            margin: EdgeInsets.only(
                              left: AppDimensions.lg,
                              right: AppDimensions.lg,
                            ),
                            prefixText:
                                dictionary.onboarding_second_title_prefix,
                            highlightText:
                                dictionary.onboarding_second_title_highlight,
                            suffixText:
                                dictionary.onboarding_second_title_suffix,
                            lineBreakAfterHighlightText: false,
                          ),
                          const SizedBox(height: AppDimensions.xxl),
                          const Expanded(
                            child: OnboardingImageWidget(
                              assetPath: AppAssets.onboardingSecond,
                              imageAlignment: Alignment.bottomCenter,
                              imageOffset: Offset(0, AppDimensions.xl),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimensions.lg,
                    right: AppDimensions.lg,
                  ),
                  child: ElevatedButton(
                    key: const Key(AppConstants.onboardingContinueButtonKey),
                    style: context.appStyle.elevatedPrimaryButtonStyle,
                    onPressed: _onContinue,
                    child: Text(
                      context.appDictionary.onboarding_continue_button,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.md),
                OnboardingPageIndicatorWidget(
                  currentIndex: _currentIndex,
                  itemCount: _itemCount,
                  animationDuration: _animationDuration,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
