import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

const Color _premiumBackgroundColor = Color(0xFF24201A);
const Color _premiumTitleGradientStart = Color(0xFFE6C990);
const Color _premiumTitleGradientEnd = Color(0xFFE4B046);
const Color _premiumSubtitleGradientStart = Color(0xCCFFDE9C);
const Color _premiumSubtitleGradientEnd = Color(0xCCF5C25B);
const Color _premiumArrowColor = Color(0xFFD0B070);

class HomePremiumBoxWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const HomePremiumBoxWidget({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.sm),
        child: Container(
          width: double.infinity,
          height: AppDimensions.xxl + AppDimensions.xxl,
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.md,
            AppDimensions.sm,
            AppDimensions.xs + AppDimensions.xxxs,
            AppDimensions.sm,
          ),
          decoration: BoxDecoration(
            color: _premiumBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.sm),
          ),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.homeMail, width: AppDimensions.xxl, height: AppDimensions.xxl),
              const SizedBox(width: AppDimensions.sm),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [_premiumTitleGradientStart, _premiumTitleGradientEnd],
                        ).createShader(bounds);
                      },
                      child: Text(
                        context.appDictionary.home_premium_title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appStyle.robotoBold16HomePremiumTitle,
                      ),
                    ),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [_premiumSubtitleGradientStart, _premiumSubtitleGradientEnd],
                        ).createShader(bounds);
                      },
                      child: Text(
                        context.appDictionary.home_premium_subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.appStyle.robotoReg13HomePremiumSubtitle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimensions.xs),
              const Icon(Icons.arrow_forward_ios_rounded, size: AppDimensions.xl, color: _premiumArrowColor),
            ],
          ),
        ),
      ),
    );
  }
}
