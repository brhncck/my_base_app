import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoriesShimmerWidget extends StatelessWidget {
  final double cardHeight;

  const HomeCategoriesShimmerWidget({required this.cardHeight, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimensions.md,
          mainAxisSpacing: AppDimensions.md,
          mainAxisExtent: cardHeight,
        ),
        itemBuilder: (_, _) {
          return Shimmer.fromColors(
            baseColor: context.appColorScheme.baseShimmerBaseColor,
            highlightColor: context.appColorScheme.baseShimmerHighlightColor,
            child: Container(
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
