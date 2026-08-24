import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/common/widget/app_error_dialog_widget.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_event.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_state.dart';

class BaseBlocBuilder<B extends StateStreamable<S>, S> extends StatelessWidget {
  const BaseBlocBuilder({
    required this.builder,
    this.bloc,
    this.buildWhen,
    this.errorBuilder,
    super.key,
  });

  final B? bloc;
  final BlocWidgetBuilder<S> builder;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocWidgetBuilder<S>? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      buildWhen: buildWhen,
      builder: (context, state) {
        if (state is BaseState && state.error?.showErrorWidget == true) {
          _showErrorModal(context, state);

          if (errorBuilder != null) {
            return errorBuilder!(context, state);
          }
        }

        return builder(context, state);
      },
    );
  }

  void _showErrorModal(BuildContext context, BaseState state) {
    final message = state.error?.message;
    if (message == null || message.isEmpty) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      showAppErrorDialog(context, message);

      final currentBloc = bloc ?? context.read<B>();
      if (currentBloc is Bloc<BaseEvent, S>) {
        currentBloc.add(const ResetError());
      }
    });
  }
}
