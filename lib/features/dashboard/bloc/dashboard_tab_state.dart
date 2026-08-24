import 'package:equatable/equatable.dart';
import 'package:my_base_app/features/dashboard/enums/dashboard_tab.dart';

class DashboardTabState extends Equatable {
  final DashboardTab selectedTab;

  const DashboardTabState({this.selectedTab = DashboardTab.home});

  DashboardTabState copyWith({DashboardTab? selectedTab}) {
    return DashboardTabState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object?> get props => [selectedTab];
}
