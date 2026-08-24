import 'package:flutter/material.dart';

class OnboardingImageWidget extends StatelessWidget {
  final String assetPath;
  final Alignment? imageAlignment;
  final Offset imageOffset;

  const OnboardingImageWidget({
    required this.assetPath,
    this.imageAlignment,
    this.imageOffset = Offset.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: imageAlignment ?? Alignment.center,
          child: Transform.translate(
            offset: imageOffset,
            child: Image.asset(
              assetPath,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
