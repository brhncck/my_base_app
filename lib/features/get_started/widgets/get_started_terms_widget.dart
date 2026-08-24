import 'package:flutter/material.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

class GetStartedTermsWidget extends StatelessWidget {
  const GetStartedTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: context.appDictionary.get_started_terms_prefix),
            const TextSpan(text: '\n'),
            TextSpan(
              text: context.appDictionary.get_started_terms_of_use,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: ' & '),
            TextSpan(
              text: context.appDictionary.get_started_privacy_policy,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: context.appStyle.robotoReg11TextMuted,
      ),
    );
  }
}
