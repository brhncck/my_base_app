import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/features/home/data/models/question_response_model.dart';
import 'package:my_base_app/features/home/widgets/home_banner_card_widget.dart';
import 'package:my_base_app/features/home/widgets/home_banner_shimmer_widget.dart';

class HomeBannerWidget extends StatelessWidget {
  final bool isLoading;
  final List<QuestionResponseModel> items;
  final ValueChanged<QuestionResponseModel>? onTap;

  const HomeBannerWidget({
    required this.isLoading,
    required this.items,
    this.onTap,
    super.key,
  });

  final double _designBannerWidth = 240;
  final double _designBannerHeight = 164;
  final double _designBannerContentHeight = 60;
  final double _designScreenWidth = 360;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerWidth = _responsiveWidth(constraints.maxWidth);
        final bannerHeight =
            bannerWidth * _designBannerHeight / _designBannerWidth;
        final bannerContentHeight =
            bannerHeight * _designBannerContentHeight / _designBannerHeight;

        if (isLoading) {
          return HomeBannerShimmerWidget(
            width: bannerWidth,
            height: bannerHeight,
          );
        }

        if (items.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: bannerHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
            itemCount: items.length,
            separatorBuilder: (_, _) =>
                const SizedBox(width: AppDimensions.xs + AppDimensions.xxxs),
            itemBuilder: (context, index) {
              final item = items[index];

              return HomeBannerCardWidget(
                item: item,
                width: bannerWidth,
                height: bannerHeight,
                contentHeight: bannerContentHeight,
                onTap: onTap == null ? null : () => onTap!(item),
              );
            },
          ),
        );
      },
    );
  }

  double _responsiveWidth(double maxWidth) {
    if (maxWidth.isInfinite) return _designBannerWidth;

    return (maxWidth * _designBannerWidth / _designScreenWidth).clamp(220, 280);
  }
}
