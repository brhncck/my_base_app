import 'dart:ui';

extension ColorAlphaExtension on Color {
  Color colorAlphaExt(double alpha) => withValues(alpha: alpha);
}
