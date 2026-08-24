import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/home/widgets/home_search_bar_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const designWidth = 360.0;

        final responsiveScale = math.min(constraints.maxWidth / designWidth, 1.0);

        double scaled(double value) => value * responsiveScale;

        return SizedBox(
          height: 151,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Positioned(
                left: scaled(-68),
                top: 90,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(0, 0, -0.95)
                    ..setEntry(0, 1, -0.29)
                    ..setEntry(1, 0, 0.31)
                    ..setEntry(1, 1, -0.96),
                  child: Image.asset(
                    AppAssets.homeLeafFirst,
                    width: scaled(117.97),
                    height: scaled(99.31),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Positioned(
                right: scaled(-20.77),
                top: 90.40,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(0, 0, -0.96)
                    ..setEntry(0, 1, -0.26)
                    ..setEntry(1, 0, -0.28)
                    ..setEntry(1, 1, 0.97),
                  child: Image.asset(
                    AppAssets.homeLeafSecond,
                    width: scaled(95.15),
                    height: scaled(86.36),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: AppDimensions.xl - AppDimensions.xxxs,
                  left: AppDimensions.lg,
                  right: AppDimensions.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.appDictionary.home_greeting_label, style: context.appStyle.robotoReg16TextPrimary),
                    const SizedBox(height: AppDimensions.xxs + AppDimensions.xxxs),
                    Text(context.appDictionary.home_greeting_title, style: context.appStyle.robotoMedium24TextPrimary),
                    const SizedBox(height: AppDimensions.md),
                    const HomeSearchBarWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
