import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double height;

  const ProfileTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
    this.height = AppDimensions.xxl * 2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tile = SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
        child: Row(
          children: [
            Container(
              width: AppDimensions.xl + AppDimensions.md,
              height: AppDimensions.xl + AppDimensions.md,
              decoration: BoxDecoration(
                color: context.appColorScheme.pageIndicatorInactiveColor,
                borderRadius: BorderRadius.circular(AppDimensions.xs),
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                size: AppDimensions.xl,
                color: context.appColorScheme.textSecondary,
              ),
            ),
            const SizedBox(width: AppDimensions.md),
            Expanded(
              child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );

    if (onTap == null) return tile;

    return Material(
      color: context.appColorScheme.white.withValues(alpha: 0),
      child: InkWell(onTap: onTap, child: tile),
    );
  }
}
