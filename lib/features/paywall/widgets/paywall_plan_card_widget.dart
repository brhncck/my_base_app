import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class PaywallPlanCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final String? badgeText;
  final double height;
  final VoidCallback? onTap;

  const PaywallPlanCardWidget({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.height,
    this.badgeText,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.md - AppDimensions.xxs),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppDimensions.xxl + AppDimensions.xs,
              sigmaY: AppDimensions.xxl + AppDimensions.xs,
            ),
            child: Container(
              height: height,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.sm + AppDimensions.xxs,
                vertical: AppDimensions.sm,
              ),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          context.appColorScheme.primaryButtonBackgroundColor
                              .withValues(alpha: 0.168),
                          context.appColorScheme.primaryButtonBackgroundColor
                              .withValues(alpha: 0),
                        ],
                      )
                    : null,
                color: isSelected
                    ? null
                    : context.appColorScheme.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(
                  AppDimensions.md - AppDimensions.xxs,
                ),
                border: Border.all(
                  color: isSelected
                      ? context.appColorScheme.primaryButtonBackgroundColor
                      : context.appColorScheme.white.withValues(alpha: 0.3),
                  width: isSelected ? 1.5 : 0.5,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (badgeText != null)
                    Positioned(
                      top: -AppDimensions.sm - AppDimensions.xxs,
                      right: -AppDimensions.sm - AppDimensions.xxs,
                      child: Container(
                        height: AppDimensions.xl + AppDimensions.xxs,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.sm,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context
                              .appColorScheme
                              .primaryButtonBackgroundColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(
                              AppDimensions.md - AppDimensions.xxs,
                            ),
                            bottomLeft: Radius.circular(AppDimensions.lg),
                          ),
                        ),
                        child: Text(
                          badgeText!,
                          style: context.appStyle.robotoMedium12White,
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      _PlanSelectionIndicatorWidget(isSelected: isSelected),
                      const SizedBox(width: AppDimensions.sm),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: context.appStyle.robotoMedium16White,
                            ),
                            const SizedBox(height: AppDimensions.xxs),
                            Text(
                              subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: isSelected
                                  ? context.appStyle.robotoReg12WhiteMuted
                                  : context.appStyle.robotoLight12WhiteMuted,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlanSelectionIndicatorWidget extends StatelessWidget {
  final bool isSelected;

  const _PlanSelectionIndicatorWidget({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.xl,
      height: AppDimensions.xl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected
            ? context.appColorScheme.primaryButtonBackgroundColor
            : context.appColorScheme.white.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
      child: isSelected
          ? Container(
              width: AppDimensions.xs,
              height: AppDimensions.xs,
              decoration: BoxDecoration(
                color: context.appColorScheme.white,
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}
