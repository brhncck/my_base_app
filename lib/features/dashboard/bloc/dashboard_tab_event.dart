import 'package:flutter/foundation.dart';
import 'package:my_base_app/features/dashboard/enums/dashboard_tab.dart';

@immutable
abstract class DashboardTabEvent {
  const DashboardTabEvent();
}

class DashboardTabChanged extends DashboardTabEvent {
  final DashboardTab tab;

  const DashboardTabChanged(this.tab);
}
