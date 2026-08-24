import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_builder.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/config/router/app_router.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_bloc.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_state.dart';
import 'package:my_base_app/features/dashboard/widgets/dashboard_scan_button_widget.dart';
import 'package:my_base_app/features/dashboard/widgets/dashboard_tab_bar_widget.dart';
import 'package:my_base_app/features/diagnose/pages/diagnose_page.dart';
import 'package:my_base_app/features/home/pages/home_page.dart';
import 'package:my_base_app/features/my_garden/pages/my_garden_page.dart';
import 'package:my_base_app/features/profile/pages/profile_page.dart';
import 'package:my_base_app/features/scan/pages/scan_page.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Duration _paywallOpenDelay = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _openPaywall());
  }

  Future<void> _openPaywall() async {
    await Future<void>.delayed(_paywallOpenDelay);
    if (!mounted) return;

    await AppNavigation.push(const PaywallRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardTabBloc>(),
      child: BaseBlocBuilder<DashboardTabBloc, DashboardTabState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.selectedTab.index,
              children: const [
                HomePage(),
                DiagnosePage(),
                ScanPage(),
                MyGardenPage(),
                ProfilePage(),
              ],
            ),
            floatingActionButton: const DashboardScanButtonWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: DashboardTabBarWidget(
              selectedTab: state.selectedTab,
            ),
          );
        },
      ),
    );
  }
}
