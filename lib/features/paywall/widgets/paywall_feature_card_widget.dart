import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class PaywallFeatureCardWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final double width;
  final double height;

  const PaywallFeatureCardWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.md - AppDimensions.xxs),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppDimensions.xs,
          sigmaY: AppDimensions.xs,
        ),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.md,
            AppDimensions.md,
            AppDimensions.xl + AppDimensions.lg - AppDimensions.xxs,
            AppDimensions.md,
          ),
          decoration: BoxDecoration(
            color: context.appColorScheme.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(
              AppDimensions.md - AppDimensions.xxs,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppDimensions.xxl + AppDimensions.xxs,
                height: AppDimensions.xxl + AppDimensions.xxs,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.appColorScheme.black.withValues(alpha: 0.24),
                  borderRadius: BorderRadius.circular(AppDimensions.xs),
                ),
                child: icon,
              ),
              const SizedBox(height: AppDimensions.sm - AppDimensions.xxs),
              Text(title, style: context.appStyle.robotoMedium20White),
              const SizedBox(height: AppDimensions.xxs),
              Text(subtitle, style: context.appStyle.robotoReg13WhiteMuted),
            ],
          ),
        ),
      ),
    );
  }
}
