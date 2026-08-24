import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/paywall/widgets/paywall_plan_card_widget.dart';

class PaywallPlansWidget extends StatefulWidget {
  const PaywallPlansWidget({super.key});

  @override
  State<PaywallPlansWidget> createState() => _PaywallPlansWidgetState();
}

class _PaywallPlansWidgetState extends State<PaywallPlansWidget> {
  final double _designPlanWidth = 320;
  final double _designPlanHeight = 63;
  bool _isYearlySelected = true;

  double get _planHeightRatio => _designPlanHeight / _designPlanWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final planWidth = constraints.maxWidth - (AppDimensions.lg * 2);
        final planHeight = planWidth * _planHeightRatio;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.lg),
          child: Column(
            children: [
              PaywallPlanCardWidget(
                title: context.appDictionary.paywall_monthly_title,
                subtitle: context.appDictionary.paywall_monthly_subtitle,
                isSelected: !_isYearlySelected,
                height: planHeight,
                onTap: () {
                  setState(() => _isYearlySelected = false);
                },
              ),
              const SizedBox(height: AppDimensions.md),
              PaywallPlanCardWidget(
                title: context.appDictionary.paywall_yearly_title,
                subtitle: context.appDictionary.paywall_yearly_subtitle,
                badgeText: context.appDictionary.paywall_yearly_badge,
                isSelected: _isYearlySelected,
                height: planHeight,
                onTap: () {
                  setState(() => _isYearlySelected = true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
