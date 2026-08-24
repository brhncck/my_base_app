import 'package:flutter/material.dart';

class OnboardingBrushUnderlinePainter extends CustomPainter {
  final Color color;

  const OnboardingBrushUnderlinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(0, size.height * 0.78)
      ..cubicTo(
        size.width * 0.22,
        size.height * 0.34,
        size.width * 0.66,
        size.height * 0.18,
        size.width,
        size.height * 0.48,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(OnboardingBrushUnderlinePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
