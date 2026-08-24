import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class PaywallHeaderTextWidget extends StatelessWidget {
  const PaywallHeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.appDictionary.paywall_title(AppConstants.appName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppConstants.appName,
                style: context.appStyle.robotoBold28White,
              ),
              TextSpan(
                text: title.replaceFirst(AppConstants.appName, ''),
                style: context.appStyle.robotoReg28White,
              ),
            ],
          ),
        ),
        Text(
          context.appDictionary.paywall_subtitle,
          style: context.appStyle.robotoReg17WhiteMuted,
        ),
      ],
    );
  }
}
