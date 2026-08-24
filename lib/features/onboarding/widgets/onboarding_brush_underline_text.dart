import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/onboarding/widgets/onboarding_brush_underline_painter.dart';

class OnBoardingBrushUnderlineText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const OnBoardingBrushUnderlineText({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(text, style: textStyle),
        Positioned(
          left: -AppDimensions.xs,
          right: -AppDimensions.md,
          bottom: -AppDimensions.xs,
          height: AppDimensions.sm,
          child: CustomPaint(
            painter: OnboardingBrushUnderlinePainter(
              color: textStyle.color ?? context.appColorScheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
