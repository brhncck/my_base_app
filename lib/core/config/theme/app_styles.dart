import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'app_color_scheme.dart';

@immutable
class AppStyles extends ThemeExtension<AppStyles> {
  final AppColorScheme scheme;

  const AppStyles(this.scheme);

  static const String _familyRoboto = 'Roboto';
  static const String _familyRubik = 'Rubik';

  TextStyle get robotoLightBase =>
      const TextStyle(fontFamily: _familyRoboto, fontWeight: FontWeight.w300);

  TextStyle get robotoRegularBase =>
      const TextStyle(fontFamily: _familyRoboto, fontWeight: FontWeight.w400);

  TextStyle get robotoMediumBase =>
      const TextStyle(fontFamily: _familyRoboto, fontWeight: FontWeight.w500);

  TextStyle get robotoSemiBoldBase =>
      const TextStyle(fontFamily: _familyRoboto, fontWeight: FontWeight.w600);

  TextStyle get robotoBoldBase =>
      const TextStyle(fontFamily: _familyRoboto, fontWeight: FontWeight.w700);

  TextStyle get rubikRegularBase =>
      const TextStyle(fontFamily: _familyRubik, fontWeight: FontWeight.w400);

  TextStyle get robotoReg11TextMuted => robotoRegularBase.copyWith(
    fontSize: 11,
    height: 15 / 11,
    color: scheme.textMuted,
  );

  TextStyle get robotoReg11WhiteMuted => robotoRegularBase.copyWith(
    fontSize: 11,
    height: 13 / 11,
    color: scheme.white.withValues(alpha: 0.52),
  );

  TextStyle get robotoLight9WhiteMuted => robotoLightBase.copyWith(
    fontSize: 9,
    height: 12 / 9,
    color: scheme.white.withValues(alpha: 0.52),
  );

  TextStyle get robotoReg13HomePremiumSubtitle =>
      robotoRegularBase.copyWith(fontSize: 13, height: 16 / 13);

  TextStyle get robotoReg13WhiteMuted => robotoRegularBase.copyWith(
    fontSize: 13,
    height: 18 / 13,
    color: scheme.white.withValues(alpha: 0.5),
  );

  TextStyle get robotoLight12WhiteMuted => robotoLightBase.copyWith(
    fontSize: 12,
    height: 14 / 12,
    color: scheme.white.withValues(alpha: 0.7),
  );

  TextStyle get robotoReg12WhiteMuted => robotoRegularBase.copyWith(
    fontSize: 12,
    height: 14 / 12,
    color: scheme.white.withValues(alpha: 0.7),
  );

  TextStyle get robotoMedium12White => robotoMediumBase.copyWith(
    fontSize: 12,
    height: 18 / 12,
    color: scheme.white,
  );

  TextStyle get robotoMedium20White => robotoMediumBase.copyWith(
    fontSize: 20,
    height: 24 / 20,
    letterSpacing: 0.38,
    color: scheme.white,
  );

  TextStyle get robotoMedium15White => robotoMediumBase.copyWith(
    fontSize: 15,
    height: 20 / 15,
    color: scheme.white,
  );

  TextStyle get robotoReg16TextPrimary => robotoRegularBase.copyWith(
    fontSize: 16,
    height: 19 / 16,
    color: scheme.textPrimary,
  );

  TextStyle get robotoReg16TextSecondary => robotoRegularBase.copyWith(
    fontSize: 16,
    height: 22 / 16,
    color: scheme.textSecondary,
  );

  TextStyle get robotoMedium16TextPrimary => robotoMediumBase.copyWith(
    fontSize: 16,
    height: 21 / 16,
    color: scheme.textPrimary,
  );

  TextStyle get robotoMedium16White => robotoMediumBase.copyWith(
    fontSize: 16,
    height: 19 / 16,
    color: scheme.white,
  );

  TextStyle get robotoBold16HomePremiumTitle =>
      robotoBoldBase.copyWith(fontSize: 16, height: 21 / 16);

  TextStyle get robotoMedium24TextPrimary => robotoMediumBase.copyWith(
    fontSize: 24,
    height: 28 / 24,
    color: scheme.textPrimary,
  );

  TextStyle get robotoReg28TextPrimary => robotoRegularBase.copyWith(
    fontSize: 28,
    height: 33 / 28,
    color: scheme.textPrimary,
  );

  TextStyle get robotoReg28White => robotoRegularBase.copyWith(
    fontSize: 28,
    height: 33 / 28,
    color: scheme.white,
  );

  TextStyle get robotoBold28White => robotoBoldBase.copyWith(
    fontSize: 28,
    height: 33 / 28,
    color: scheme.white,
  );

  TextStyle get robotoMedium28TextPrimary => robotoMediumBase.copyWith(
    fontSize: 28,
    height: 33 / 28,
    letterSpacing: -1,
    color: scheme.textPrimary,
  );

  TextStyle get robotoSemiBold28TextPrimary => robotoSemiBoldBase.copyWith(
    fontSize: 28,
    height: 33 / 28,
    color: scheme.textPrimary,
  );

  TextStyle get robotoReg17WhiteMuted => robotoRegularBase.copyWith(
    fontSize: 17,
    height: 24 / 17,
    color: scheme.white.withValues(alpha: 0.7),
  );

  TextStyle get rubikReg15HomeSearchHint => rubikRegularBase.copyWith(
    fontSize: 15.5,
    height: 18 / 15.5,
    letterSpacing: 0.07,
    color: scheme.homeSearchHint,
  );

  ButtonStyle get elevatedPrimaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: scheme.primaryButtonBackgroundColor,
    foregroundColor: scheme.primaryButtonForegroundColor,
    elevation: 0,
    minimumSize: const Size(
      double.infinity,
      AppDimensions.xxl + AppDimensions.xl,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimensions.md,
      vertical: AppDimensions.md + AppDimensions.xxxs,
    ),
    textStyle: robotoSemiBoldBase.copyWith(fontSize: 16, height: 24 / 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.sm),
    ),
  );

  @override
  AppStyles copyWith({AppColorScheme? scheme}) {
    return AppStyles(scheme ?? this.scheme);
  }

  @override
  AppStyles lerp(covariant ThemeExtension<AppStyles>? other, double t) {
    if (other is! AppStyles) return this;

    return AppStyles(scheme.lerp(other.scheme, t));
  }
}
