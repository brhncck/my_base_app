import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_bloc.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_event.dart';
import 'package:my_base_app/features/dashboard/enums/dashboard_tab.dart';

class DashboardScanButtonWidget extends StatelessWidget {
  const DashboardScanButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key(AppConstants.dashboardScanTabKey),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<DashboardTabBloc>().add(
          const DashboardTabChanged(DashboardTab.scan),
        );
      },
      child: Container(
        width: AppDimensions.xxl * 2 + AppDimensions.xxxs,
        height: AppDimensions.xxl * 2 + AppDimensions.xxxs,
        padding: const EdgeInsets.all(AppDimensions.lg),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: const Alignment(-0.45, -0.89),
            end: const Alignment(0.45, 0.89),
            colors: [
              context.appColorScheme.primaryButtonBackgroundColor,
              context.appColorScheme.dashboardScanGradientEnd,
            ],
          ),
          border: Border.all(
            color: context.appColorScheme.white.withValues(alpha: 0.24),
            width: AppDimensions.xxs,
          ),
        ),
        child: SvgPicture.asset(
          AppAssets.tabbarScan,
          width: AppDimensions.xl + AppDimensions.xxxs,
          height: AppDimensions.xl + AppDimensions.xxxs,
          colorFilter: ColorFilter.mode(
            context.appColorScheme.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
