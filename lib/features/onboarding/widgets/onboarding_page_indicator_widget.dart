import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/core/extension/color_alpha_extension.dart';

class OnboardingPageIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Duration animationDuration;
  final Curve _animationCurve = Curves.easeOut;

  const OnboardingPageIndicatorWidget({
    required this.currentIndex,
    required this.itemCount,
    required this.animationDuration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isActive = index == currentIndex;

        return SizedBox(
          width: AppDimensions.lg,
          height: AppDimensions.lg,
          child: Center(
            child: AnimatedContainer(
              duration: animationDuration,
              curve: _animationCurve,
              width: isActive
                  ? AppDimensions.xs + AppDimensions.xxxs
                  : AppDimensions.xxs + AppDimensions.xxxs,
              height: isActive
                  ? AppDimensions.xs + AppDimensions.xxxs
                  : AppDimensions.xxs + AppDimensions.xxxs,
              decoration: BoxDecoration(
                color: isActive
                    ? context.appColorScheme.textPrimary
                    : context.appColorScheme.textPrimary.colorAlphaExt(0.25),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
