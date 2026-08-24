import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.xl + AppDimensions.lg,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.md,
        vertical: AppDimensions.sm,
      ),
      decoration: BoxDecoration(
        color: context.appColorScheme.homeSearchBackground,
        borderRadius: BorderRadius.circular(AppDimensions.sm),
        border: Border.all(
          color: context.appColorScheme.homeSearchBorder,
          width: 0.2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: AppDimensions.lg,
            color: context.appColorScheme.homeSearchIcon,
          ),
          const SizedBox(width: AppDimensions.xs + AppDimensions.xxxs),
          Text(
            context.appDictionary.home_search_hint,
            style: context.appStyle.rubikReg15HomeSearchHint,
          ),
        ],
      ),
    );
  }
}
