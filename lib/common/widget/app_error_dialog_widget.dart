import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';

Future<void> showAppErrorDialog(BuildContext context, String message) {
  return showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    enableDrag: false,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => AppErrorDialogWidget(message: message),
  );
}

class AppErrorDialogWidget extends StatelessWidget {
  final String message;

  const AppErrorDialogWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    return Material(
      color: context.theme.colorScheme.surface,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(AppDimensions.xl),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppDimensions.xl,
          AppDimensions.xxl,
          AppDimensions.xl,
          bottomPadding + AppDimensions.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(message, style: context.appStyle.robotoReg16TextPrimary),
            const SizedBox(height: AppDimensions.xl),
            ElevatedButton(
              style: context.appStyle.elevatedPrimaryButtonStyle.copyWith(
                minimumSize: const WidgetStatePropertyAll(
                  Size(double.infinity, AppDimensions.xxxl),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
    );
  }
}
