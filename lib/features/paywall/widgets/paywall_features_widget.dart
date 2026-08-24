import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/paywall/widgets/paywall_feature_card_widget.dart';

class PaywallFeaturesWidget extends StatelessWidget {
  const PaywallFeaturesWidget({super.key});

  final double _designScreenWidth = 360;
  final double _designCardWidth = 155;
  final double _designCardHeight = 124;

  double get _cardWidthRatio => _designCardWidth / _designScreenWidth;
  double get _cardHeightRatio => _designCardHeight / _designCardWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth * _cardWidthRatio;
        final cardHeight = cardWidth * _cardHeightRatio;

        return SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
            itemCount: 4,
            separatorBuilder: (_, _) => const SizedBox(width: AppDimensions.sm),
            itemBuilder: (context, index) {
              final isUnlimited = index.isEven;

              return PaywallFeatureCardWidget(
                width: cardWidth,
                height: cardHeight,
                icon: isUnlimited
                    ? SvgPicture.asset(
                        AppAssets.tabbarScan,
                        width: AppDimensions.lg,
                        height: AppDimensions.lg,
                        colorFilter: ColorFilter.mode(
                          context.appColorScheme.white,
                          BlendMode.srcIn,
                        ),
                      )
                    : Icon(
                        Icons.speed_rounded,
                        size: AppDimensions.lg,
                        color: context.appColorScheme.white.withValues(
                          alpha: 0.7,
                        ),
                      ),
                title: isUnlimited
                    ? context.appDictionary.paywall_feature_unlimited_title
                    : context.appDictionary.paywall_feature_faster_title,
                subtitle: isUnlimited
                    ? context.appDictionary.paywall_feature_unlimited_subtitle
                    : context.appDictionary.paywall_feature_faster_subtitle,
              );
            },
          ),
        );
      },
    );
  }
}
