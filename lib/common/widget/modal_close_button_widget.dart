import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/core/extension/color_alpha_extension.dart';

class ModalCloseButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;

  const ModalCloseButtonWidget({
    this.onPressed,
    this.size = AppDimensions.xl + AppDimensions.xxs,
    this.iconSize = AppDimensions.md,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.appColorScheme.black.colorAlphaExt(0.4),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed ?? AppNavigation.pop,
          tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          visualDensity: VisualDensity.compact,
          style: IconButton.styleFrom(
            foregroundColor: context.appColorScheme.white,
            minimumSize: Size.square(size),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(
            Icons.close_rounded,
            size: iconSize,
            color: context.appColorScheme.white,
          ),
        ),
      ),
    );
  }
}
