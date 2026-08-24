import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_dimensions.dart';

class GetStartedPlantImageWidget extends StatelessWidget {
  const GetStartedPlantImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxHeight;
        final imageWidth = constraints.maxWidth;

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDimensions.md),
            child: Image.asset(
              AppAssets.getStarted,
              width: imageWidth,
              height: imageHeight,
            ),
          ),
        );
      },
    );
  }
}
