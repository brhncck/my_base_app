import 'package:flutter/material.dart';
import 'package:my_base_app/constants/app_assets.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/extension/build_context_extension.dart';
import 'package:my_base_app/features/dashboard/enums/dashboard_tab.dart';
import 'package:my_base_app/features/dashboard/widgets/dashboard_tab_item_widget.dart';

class DashboardTabBarWidget extends StatelessWidget {
  final DashboardTab selectedTab;

  const DashboardTabBarWidget({required this.selectedTab, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: AppDimensions.xxxl + AppDimensions.xxl,
        decoration: BoxDecoration(
          color: context.appColorScheme.dashboardTabBarBackground,
          border: Border(
            top: BorderSide(
              color: context.appColorScheme.dashboardTabBarBorder,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DashboardTabItemWidget(
              tab: DashboardTab.home,
              selectedTab: selectedTab,
              iconPath: AppAssets.tabbarHome,
              label: context.appDictionary.home_nav_home,
            ),
            DashboardTabItemWidget(
              tab: DashboardTab.diagnose,
              selectedTab: selectedTab,
              iconPath: AppAssets.tabbarDiagnose,
              label: context.appDictionary.home_nav_diagnose,
            ),
            const SizedBox(width: AppDimensions.xxl * 2 + AppDimensions.xxxs),
            DashboardTabItemWidget(
              tab: DashboardTab.myGarden,
              selectedTab: selectedTab,
              iconPath: AppAssets.tabbarMyGarden,
              label: context.appDictionary.home_nav_garden,
            ),
            DashboardTabItemWidget(
              tab: DashboardTab.profile,
              selectedTab: selectedTab,
              iconPath: AppAssets.tabbarProfile,
              label: context.appDictionary.home_nav_profile,
            ),
          ],
        ),
      ),
    );
  }
}
