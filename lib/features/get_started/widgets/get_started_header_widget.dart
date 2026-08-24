import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class GetStartedHeaderWidget extends StatelessWidget {
  const GetStartedHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.appDictionary.get_started_title(AppConstants.appName);
    final appNameIndex = title.indexOf(AppConstants.appName);
    final appNameEndIndex = appNameIndex + AppConstants.appName.length;

    return Text.rich(
      TextSpan(
        children: appNameIndex < 0
            ? [TextSpan(text: title)]
            : [
                TextSpan(text: title.substring(0, appNameIndex)),
                TextSpan(
                  text: AppConstants.appName,
                  style: context.appStyle.robotoSemiBold28TextPrimary,
                ),
                TextSpan(text: title.substring(appNameEndIndex)),
              ],
      ),
      style: context.appStyle.robotoReg28TextPrimary,
    );
  }
}
