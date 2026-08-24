import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_event.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_state.dart';

class DashboardTabBloc extends Bloc<DashboardTabEvent, DashboardTabState> {
  DashboardTabBloc() : super(const DashboardTabState()) {
    on<DashboardTabChanged>(_onDashboardTabChanged);
  }

  void _onDashboardTabChanged(
    DashboardTabChanged event,
    Emitter<DashboardTabState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.tab));
  }
}
