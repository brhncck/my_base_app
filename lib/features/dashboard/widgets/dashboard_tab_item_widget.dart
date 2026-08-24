import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_bloc.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_event.dart';
import 'package:my_base_app/features/dashboard/enums/dashboard_tab.dart';

class DashboardTabItemWidget extends StatelessWidget {
  final DashboardTab tab;
  final DashboardTab selectedTab;
  final String iconPath;
  final String label;

  const DashboardTabItemWidget({
    required this.tab,
    required this.selectedTab,
    required this.iconPath,
    required this.label,
    super.key,
  });

  String get _key {
    return switch (tab) {
      DashboardTab.home => AppConstants.dashboardHomeTabKey,
      DashboardTab.diagnose => AppConstants.dashboardDiagnoseTabKey,
      DashboardTab.scan => AppConstants.dashboardScanTabKey,
      DashboardTab.myGarden => AppConstants.dashboardMyGardenTabKey,
      DashboardTab.profile => AppConstants.dashboardProfileTabKey,
    };
  }

  @override
  Widget build(BuildContext context) {
    final isActive = selectedTab == tab;
    final colorScheme = context.appColorScheme;
    final color = isActive
        ? colorScheme.primaryButtonBackgroundColor
        : colorScheme.textMuted;

    return GestureDetector(
      key: Key(_key),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<DashboardTabBloc>().add(DashboardTabChanged(tab));
      },
      child: SizedBox(
        width: AppDimensions.xxl * 2 + AppDimensions.xxs,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: AppDimensions.xl,
              height: AppDimensions.xl,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            const SizedBox(height: AppDimensions.xxs),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appStyle.robotoRegularBase.copyWith(
                color: color,
                fontSize: 11,
                height: 14 / 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
