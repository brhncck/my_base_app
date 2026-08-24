import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomeBannerShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const HomeBannerShimmerWidget({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
        itemCount: 2,
        separatorBuilder: (_, _) =>
            const SizedBox(width: AppDimensions.xs + AppDimensions.xxxs),
        itemBuilder: (_, _) {
          return Shimmer.fromColors(
            baseColor: context.appColorScheme.baseShimmerBaseColor,
            highlightColor: context.appColorScheme.baseShimmerHighlightColor,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: context.appColorScheme.baseShimmerBaseColor,
                borderRadius: BorderRadius.circular(AppDimensions.sm),
              ),
            ),
          );
        },
      ),
    );
  }
}
