import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/cache/app_image_cache_manager.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/home/data/models/category_model.dart';

class HomeCategoryCardWidget extends StatelessWidget {
  final CategoryModel item;
  final VoidCallback? onTap;

  const HomeCategoryCardWidget({required this.item, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimensions.sm),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: context.appColorScheme.homeCategoryCardBackground,
            borderRadius: BorderRadius.circular(AppDimensions.sm),
            border: Border.all(
              color: context.appColorScheme.homeCategoryCardBorder,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: AppDimensions.md,
                top: AppDimensions.md,
                right: AppDimensions.sm,
                child: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appStyle.robotoMedium16TextPrimary,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                width: AppDimensions.xxxl * 2 + AppDimensions.sm,
                height: AppDimensions.xxxl * 2 + AppDimensions.sm,
                child: CachedNetworkImage(
                  imageUrl: item.image.url,
                  cacheManager: AppImageCacheManager.instance,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                  placeholder: (_, _) => const SizedBox.shrink(),
                  errorWidget: (_, _, _) => const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
