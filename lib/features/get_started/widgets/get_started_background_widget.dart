import 'package:flutter/material.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/get_started/widgets/get_started_glow_circle_widget.dart';

class GetStartedBackgroundWidget extends StatelessWidget {
  const GetStartedBackgroundWidget({super.key});

  final double _designWidth = 360;
  final double _designHeight = 800;
  final double _blur = 98;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              context.appColorScheme.primaryBackgroundGradientStart,
              context.appColorScheme.primaryBackgroundGradientEnd,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final scaleX = constraints.maxWidth / _designWidth;
            final scaleY = constraints.maxHeight / _designHeight;

            return ClipRect(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GetStartedGlowCircleWidget(
                    left: 244.33 * scaleX,
                    top: -500.49 * scaleY,
                    size: 952.26 * scaleX,
                    color: const Color(0xFFC0F0FF),
                    opacity: 0.49,
                    blur: _blur,
                  ),
                  GetStartedGlowCircleWidget(
                    left: -305.42 * scaleX,
                    top: 162.56 * scaleY,
                    size: 418.72 * scaleX,
                    color: const Color(0xFFC0F0FF),
                    opacity: 0.25,
                    blur: _blur,
                  ),
                  GetStartedGlowCircleWidget(
                    left: -235.47 * scaleX,
                    top: 309.36 * scaleY,
                    size: 186.21 * scaleX,
                    color: const Color(0xFFE7C0FF),
                    opacity: 0.25,
                    blur: _blur,
                  ),
                  GetStartedGlowCircleWidget(
                    left: 347.90 * scaleX,
                    top: -492.41 * scaleY,
                    size: 952.26 * scaleX,
                    color: const Color(0xFF93AAFF),
                    opacity: 0.24,
                    blur: _blur,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
