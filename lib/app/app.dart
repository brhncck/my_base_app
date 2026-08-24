import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_bloc.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_event.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_state.dart';
import 'package:my_base_app/core/config/router/app_router.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/config/theme/app_theme.dart';
import 'package:my_base_app/l10n/app_localizations.dart';

final AppRouter _appRouter = AppRouter();

class MyBaseApp extends StatelessWidget {
  const MyBaseApp({super.key});

  void _unfocus() {
    final primary = FocusManager.instance.primaryFocus;
    if (primary != null && primary.hasFocus) primary.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppSettingsBloc>(
      create: (_) =>
          getIt<AppSettingsBloc>()..add(const LoadAppSettingsEvent()),
      child: BaseBlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _unfocus,
            onPanDown: (_) => _unfocus(),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.build(Brightness.light),
              darkTheme: AppTheme.build(Brightness.dark),
              themeMode: state.themeMode,
              locale: state.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          );
        },
      ),
    );
  }
}
