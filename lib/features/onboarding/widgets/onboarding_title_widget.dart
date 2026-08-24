import 'package:flutter/material.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/onboarding/widgets/onboarding_brush_underline_text.dart';

class OnboardingTitleWidget extends StatelessWidget {
  final EdgeInsets margin;
  final String prefixText;
  final String highlightText;
  final String suffixText;
  final bool lineBreakAfterHighlightText;

  const OnboardingTitleWidget({
    required this.margin,
    required this.prefixText,
    required this.highlightText,
    required this.suffixText,
    this.lineBreakAfterHighlightText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.appStyle.robotoMedium28TextPrimary;

    return Container(
      color: Colors.transparent,
      margin: margin,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: prefixText),
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: OnBoardingBrushUnderlineText(text: highlightText, textStyle: titleStyle),
            ),
            TextSpan(text: lineBreakAfterHighlightText ? '\n${suffixText.trimLeft()}' : suffixText),
          ],
        ),
        style: titleStyle,
      ),
    );
  }
}
