import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/features/home/data/models/category_model.dart';
import 'package:my_base_app/features/home/widgets/home_categories_shimmer_widget.dart';
import 'package:my_base_app/features/home/widgets/home_category_card_widget.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final bool isLoading;
  final List<CategoryModel> items;
  final ValueChanged<CategoryModel>? onTap;

  const HomeCategoriesWidget({
    required this.isLoading,
    required this.items,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = _responsiveCardHeight(constraints.maxWidth);

        if (isLoading) {
          return HomeCategoriesShimmerWidget(cardHeight: cardHeight);
        }

        if (items.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppDimensions.md,
              mainAxisSpacing: AppDimensions.md,
              mainAxisExtent: cardHeight,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return HomeCategoryCardWidget(
                item: item,
                onTap: onTap == null ? null : () => onTap!(item),
              );
            },
          ),
        );
      },
    );
  }

  double _responsiveCardHeight(double maxWidth) {
    if (maxWidth.isInfinite) return 152;

    return (maxWidth - (AppDimensions.lg * 2) - AppDimensions.md) / 2;
  }
}
