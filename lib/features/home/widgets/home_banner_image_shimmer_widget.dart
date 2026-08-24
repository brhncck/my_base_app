import 'package:flutter/material.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:shimmer/shimmer.dart';

class HomeBannerImageShimmerWidget extends StatelessWidget {
  const HomeBannerImageShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.appColorScheme.baseShimmerBaseColor,
      highlightColor: context.appColorScheme.baseShimmerHighlightColor,
      child: ColoredBox(color: context.appColorScheme.baseShimmerBaseColor),
    );
  }
}
