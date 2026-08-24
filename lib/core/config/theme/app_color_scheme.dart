import 'package:flutter/material.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primaryBackgroundGradientStart;
  final Color primaryBackgroundGradientEnd;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  final Color primaryButtonBackgroundColor;
  final Color primaryButtonForegroundColor;

  final Color pageIndicatorActiveColor;
  final Color pageIndicatorInactiveColor;

  final Color dashboardTabBarBackground;
  final Color dashboardTabBarBorder;
  final Color dashboardTabSelected;
  final Color dashboardTabIconUnselected;
  final Color dashboardTabTextUnselected;
  final Color dashboardScanGradientEnd;

  final Color homeSearchBackground;
  final Color homeSearchBorder;
  final Color homeSearchIcon;
  final Color homeSearchHint;
  final Color homeBannerImageOverlay;
  final Color homeBannerContentBackground;
  final Color homeBannerContentBorder;
  final Color homeCategoryCardBackground;
  final Color homeCategoryCardBorder;
  final Color baseShimmerBaseColor;
  final Color baseShimmerHighlightColor;
  final Color paywallBackground;

  final Color white;
  final Color black;

  const AppColorScheme({
    required this.primaryBackgroundGradientStart,
    required this.primaryBackgroundGradientEnd,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.primaryButtonBackgroundColor,
    required this.primaryButtonForegroundColor,
    required this.pageIndicatorActiveColor,
    required this.pageIndicatorInactiveColor,
    required this.dashboardTabBarBackground,
    required this.dashboardTabBarBorder,
    required this.dashboardTabSelected,
    required this.dashboardTabIconUnselected,
    required this.dashboardTabTextUnselected,
    required this.dashboardScanGradientEnd,
    required this.homeSearchBackground,
    required this.homeSearchBorder,
    required this.homeSearchIcon,
    required this.homeSearchHint,
    required this.homeBannerImageOverlay,
    required this.homeBannerContentBackground,
    required this.homeBannerContentBorder,
    required this.homeCategoryCardBackground,
    required this.homeCategoryCardBorder,
    required this.baseShimmerBaseColor,
    required this.baseShimmerHighlightColor,
    required this.paywallBackground,
    required this.white,
    required this.black,
  });

  static AppColorScheme getColorScheme(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

  static const light = AppColorScheme(
    primaryBackgroundGradientStart: Color(0xFFF8FAFF),
    primaryBackgroundGradientEnd: Color(0xFFFAFAFA),

    textPrimary: Color(0xFF13231B),
    textSecondary: Color(0xB313231B),
    textMuted: Color(0xB3597165),

    primaryButtonBackgroundColor: Color(0xFF28AF6E),
    primaryButtonForegroundColor: Color(0xFFFFFFFF),

    pageIndicatorActiveColor: Color(0xFF13231B),
    pageIndicatorInactiveColor: Color(0x4013231B),

    dashboardTabBarBackground: Color(0xEBFFFFFF),
    dashboardTabBarBorder: Color(0x1A13231B),
    dashboardTabSelected: Color(0xFF28AF6E),
    dashboardTabIconUnselected: Color(0xFFBDBDBD),
    dashboardTabTextUnselected: Color(0xFF979798),
    dashboardScanGradientEnd: Color(0xFF2CCC80),

    homeSearchBackground: Color(0xE0FFFFFF),
    homeSearchBorder: Color(0x403C3C43),
    homeSearchIcon: Color(0xFFABABAB),
    homeSearchHint: Color(0xFFAFAFAF),
    homeBannerImageOverlay: Color(0x26000000),
    homeBannerContentBackground: Color(0x33000000),
    homeBannerContentBorder: Color(0x1AFFFFFF),
    homeCategoryCardBackground: Color(0xFFF4F6F6),
    homeCategoryCardBorder: Color(0x1A13231B),
    baseShimmerBaseColor: Color(0xFFE7E7E7),
    baseShimmerHighlightColor: Color(0xFFF5F5F5),
    paywallBackground: Color(0xFF071A12),

    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
  );

  static const dark = AppColorScheme(
    primaryBackgroundGradientStart: Color(0xFF13251C),
    primaryBackgroundGradientEnd: Color(0xFF101E17),

    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xB3FFFFFF),
    textMuted: Color(0x85FFFFFF),

    primaryButtonBackgroundColor: Color(0xFF28AF6E),
    primaryButtonForegroundColor: Color(0xFFFFFFFF),

    pageIndicatorActiveColor: Color(0xFFFFFFFF),
    pageIndicatorInactiveColor: Color(0x40FFFFFF),

    dashboardTabBarBackground: Color(0xEB101E17),
    dashboardTabBarBorder: Color(0x1AFFFFFF),
    dashboardTabSelected: Color(0xFF28AF6E),
    dashboardTabIconUnselected: Color(0xFF8A8A8A),
    dashboardTabTextUnselected: Color(0xFF979798),
    dashboardScanGradientEnd: Color(0xFF2CCC80),

    homeSearchBackground: Color(0xE01C252D),
    homeSearchBorder: Color(0x40FFFFFF),
    homeSearchIcon: Color(0xFFABABAB),
    homeSearchHint: Color(0xFFAFAFAF),
    homeBannerImageOverlay: Color(0x26000000),
    homeBannerContentBackground: Color(0x33000000),
    homeBannerContentBorder: Color(0x1AFFFFFF),
    homeCategoryCardBackground: Color(0xFF1B2A22),
    homeCategoryCardBorder: Color(0x1AFFFFFF),
    baseShimmerBaseColor: Color(0xFF24342B),
    baseShimmerHighlightColor: Color(0xFF32483B),
    paywallBackground: Color(0xFF071A12),

    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
  );

  @override
  AppColorScheme copyWith({
    Color? primaryBackgroundGradientStart,
    Color? primaryBackgroundGradientEnd,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? primaryButtonBackgroundColor,
    Color? primaryButtonForegroundColor,
    Color? pageIndicatorActiveColor,
    Color? pageIndicatorInactiveColor,
    Color? dashboardTabBarBackground,
    Color? dashboardTabBarBorder,
    Color? dashboardTabSelected,
    Color? dashboardTabIconUnselected,
    Color? dashboardTabTextUnselected,
    Color? dashboardScanGradientEnd,
    Color? homeSearchBackground,
    Color? homeSearchBorder,
    Color? homeSearchIcon,
    Color? homeSearchHint,
    Color? homeBannerImageOverlay,
    Color? homeBannerContentBackground,
    Color? homeBannerContentBorder,
    Color? homeCategoryCardBackground,
    Color? homeCategoryCardBorder,
    Color? baseShimmerBaseColor,
    Color? baseShimmerHighlightColor,
    Color? paywallBackground,
    Color? white,
    Color? black,
  }) {
    return AppColorScheme(
      primaryBackgroundGradientStart:
          primaryBackgroundGradientStart ?? this.primaryBackgroundGradientStart,
      primaryBackgroundGradientEnd:
          primaryBackgroundGradientEnd ?? this.primaryBackgroundGradientEnd,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      primaryButtonBackgroundColor:
          primaryButtonBackgroundColor ?? this.primaryButtonBackgroundColor,
      primaryButtonForegroundColor:
          primaryButtonForegroundColor ?? this.primaryButtonForegroundColor,
      pageIndicatorActiveColor:
          pageIndicatorActiveColor ?? this.pageIndicatorActiveColor,
      pageIndicatorInactiveColor:
          pageIndicatorInactiveColor ?? this.pageIndicatorInactiveColor,
      dashboardTabBarBackground:
          dashboardTabBarBackground ?? this.dashboardTabBarBackground,
      dashboardTabBarBorder:
          dashboardTabBarBorder ?? this.dashboardTabBarBorder,
      dashboardTabSelected: dashboardTabSelected ?? this.dashboardTabSelected,
      dashboardTabIconUnselected:
          dashboardTabIconUnselected ?? this.dashboardTabIconUnselected,
      dashboardTabTextUnselected:
          dashboardTabTextUnselected ?? this.dashboardTabTextUnselected,
      dashboardScanGradientEnd:
          dashboardScanGradientEnd ?? this.dashboardScanGradientEnd,
      homeSearchBackground: homeSearchBackground ?? this.homeSearchBackground,
      homeSearchBorder: homeSearchBorder ?? this.homeSearchBorder,
      homeSearchIcon: homeSearchIcon ?? this.homeSearchIcon,
      homeSearchHint: homeSearchHint ?? this.homeSearchHint,
      homeBannerImageOverlay:
          homeBannerImageOverlay ?? this.homeBannerImageOverlay,
      homeBannerContentBackground:
          homeBannerContentBackground ?? this.homeBannerContentBackground,
      homeBannerContentBorder:
          homeBannerContentBorder ?? this.homeBannerContentBorder,
      homeCategoryCardBackground:
          homeCategoryCardBackground ?? this.homeCategoryCardBackground,
      homeCategoryCardBorder:
          homeCategoryCardBorder ?? this.homeCategoryCardBorder,
      baseShimmerBaseColor: baseShimmerBaseColor ?? this.baseShimmerBaseColor,
      baseShimmerHighlightColor:
          baseShimmerHighlightColor ?? this.baseShimmerHighlightColor,
      paywallBackground: paywallBackground ?? this.paywallBackground,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  AppColorScheme lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;

    return AppColorScheme(
      primaryBackgroundGradientStart: Color.lerp(
        primaryBackgroundGradientStart,
        other.primaryBackgroundGradientStart,
        t,
      )!,
      primaryBackgroundGradientEnd: Color.lerp(
        primaryBackgroundGradientEnd,
        other.primaryBackgroundGradientEnd,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      primaryButtonBackgroundColor: Color.lerp(
        primaryButtonBackgroundColor,
        other.primaryButtonBackgroundColor,
        t,
      )!,
      primaryButtonForegroundColor: Color.lerp(
        primaryButtonForegroundColor,
        other.primaryButtonForegroundColor,
        t,
      )!,
      pageIndicatorActiveColor: Color.lerp(
        pageIndicatorActiveColor,
        other.pageIndicatorActiveColor,
        t,
      )!,
      pageIndicatorInactiveColor: Color.lerp(
        pageIndicatorInactiveColor,
        other.pageIndicatorInactiveColor,
        t,
      )!,
      dashboardTabBarBackground: Color.lerp(
        dashboardTabBarBackground,
        other.dashboardTabBarBackground,
        t,
      )!,
      dashboardTabBarBorder: Color.lerp(
        dashboardTabBarBorder,
        other.dashboardTabBarBorder,
        t,
      )!,
      dashboardTabSelected: Color.lerp(
        dashboardTabSelected,
        other.dashboardTabSelected,
        t,
      )!,
      dashboardTabIconUnselected: Color.lerp(
        dashboardTabIconUnselected,
        other.dashboardTabIconUnselected,
        t,
      )!,
      dashboardTabTextUnselected: Color.lerp(
        dashboardTabTextUnselected,
        other.dashboardTabTextUnselected,
        t,
      )!,
      dashboardScanGradientEnd: Color.lerp(
        dashboardScanGradientEnd,
        other.dashboardScanGradientEnd,
        t,
      )!,
      homeSearchBackground: Color.lerp(
        homeSearchBackground,
        other.homeSearchBackground,
        t,
      )!,
      homeSearchBorder: Color.lerp(
        homeSearchBorder,
        other.homeSearchBorder,
        t,
      )!,
      homeSearchIcon: Color.lerp(homeSearchIcon, other.homeSearchIcon, t)!,
      homeSearchHint: Color.lerp(homeSearchHint, other.homeSearchHint, t)!,
      homeBannerImageOverlay: Color.lerp(
        homeBannerImageOverlay,
        other.homeBannerImageOverlay,
        t,
      )!,
      homeBannerContentBackground: Color.lerp(
        homeBannerContentBackground,
        other.homeBannerContentBackground,
        t,
      )!,
      homeBannerContentBorder: Color.lerp(
        homeBannerContentBorder,
        other.homeBannerContentBorder,
        t,
      )!,
      homeCategoryCardBackground: Color.lerp(
        homeCategoryCardBackground,
        other.homeCategoryCardBackground,
        t,
      )!,
      homeCategoryCardBorder: Color.lerp(
        homeCategoryCardBorder,
        other.homeCategoryCardBorder,
        t,
      )!,
      baseShimmerBaseColor: Color.lerp(
        baseShimmerBaseColor,
        other.baseShimmerBaseColor,
        t,
      )!,
      baseShimmerHighlightColor: Color.lerp(
        baseShimmerHighlightColor,
        other.baseShimmerHighlightColor,
        t,
      )!,
      paywallBackground: Color.lerp(
        paywallBackground,
        other.paywallBackground,
        t,
      )!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
