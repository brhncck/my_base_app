import 'dart:ui';

import 'package:flutter/material.dart';

class GetStartedGlowCircleWidget extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Color color;
  final double opacity;
  final double blur;

  const GetStartedGlowCircleWidget({
    required this.left,
    required this.top,
    required this.size,
    required this.color,
    required this.opacity,
    required this.blur,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      width: size,
      height: size,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: opacity),
          ),
        ),
      ),
    );
  }
}
