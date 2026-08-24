import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/cache/app_image_cache_manager.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/home/data/models/question_response_model.dart';
import 'package:my_base_app/features/home/widgets/home_banner_image_shimmer_widget.dart';

class HomeBannerCardWidget extends StatelessWidget {
  final QuestionResponseModel item;
  final double width;
  final double height;
  final double contentHeight;
  final VoidCallback? onTap;

  const HomeBannerCardWidget({
    required this.item,
    required this.width,
    required this.height,
    required this.contentHeight,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppDimensions.sm),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: item.imageUri,
                cacheManager: AppImageCacheManager.instance,
                fit: BoxFit.cover,
                placeholder: (_, _) => const HomeBannerImageShimmerWidget(),
                errorWidget: (_, _, _) {
                  return ColoredBox(
                    color: context.appColorScheme.baseShimmerBaseColor,
                  );
                },
              ),

              ColoredBox(color: context.appColorScheme.homeBannerImageOverlay),

              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppDimensions.sm),
                    bottomRight: Radius.circular(AppDimensions.sm),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      width: double.infinity,
                      height: contentHeight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.sm + AppDimensions.xxxs,
                        vertical: AppDimensions.xs + AppDimensions.xxxs,
                      ),
                      decoration: BoxDecoration(
                        color:
                            context.appColorScheme.homeBannerContentBackground,
                        border: Border(
                          top: BorderSide(
                            color:
                                context.appColorScheme.homeBannerContentBorder,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.appStyle.robotoMedium15White,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
