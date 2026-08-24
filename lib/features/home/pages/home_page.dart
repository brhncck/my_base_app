import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/constants/app_constants.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_builder.dart';
import 'package:my_base_app/constants/app_dimensions.dart';
import 'package:my_base_app/core/bloc/base/page_state.dart';
import 'package:my_base_app/core/config/router/app_navigation.dart';
import 'package:my_base_app/core/config/router/app_router.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/features/home/bloc/home_bloc.dart';
import 'package:my_base_app/features/home/bloc/home_event.dart';
import 'package:my_base_app/features/home/bloc/home_state.dart';
import 'package:my_base_app/features/home/widgets/home_banner_widget.dart';
import 'package:my_base_app/features/home/widgets/home_categories_widget.dart';
import 'package:my_base_app/features/home/widgets/home_header_widget.dart';
import 'package:my_base_app/features/home/widgets/home_premium_box_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();

    _homeBloc = getIt<HomeBloc>()
      ..add(const GetQuestionsEvent())
      ..add(const GetCategoriesEvent());
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  Future<void> _openPaywallModal() {
    return AppNavigation.push(const PaywallRoute());
  }

  Future<void> _refreshHome() {
    final refreshFuture = _homeBloc.stream.firstWhere((state) {
      final isQuestionsRefreshing =
          state.questionsState == PageState.initial ||
          state.questionsState == PageState.loading;
      final isCategoriesRefreshing =
          state.categoriesState == PageState.initial ||
          state.categoriesState == PageState.loading;

      return !isQuestionsRefreshing && !isCategoriesRefreshing;
    });

    _homeBloc.add(const RefreshHomeEvent());

    return refreshFuture;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: SafeArea(
        key: const Key(AppConstants.homePageKey),
        bottom: false,
        child: BaseBlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final isQuestionsLoading =
                state.questionsState == PageState.initial ||
                state.questionsState == PageState.loading;
            final isCategoriesLoading =
                state.categoriesState == PageState.initial ||
                state.categoriesState == PageState.loading;

            return RefreshIndicator(
              onRefresh: _refreshHome,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  children: [
                    const HomeHeaderWidget(),

                    const SizedBox(height: AppDimensions.xl),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.lg,
                      ),
                      child: HomePremiumBoxWidget(onTap: _openPaywallModal),
                    ),

                    const SizedBox(height: AppDimensions.xl),

                    HomeBannerWidget(
                      isLoading: isQuestionsLoading,
                      items: state.questions,
                    ),

                    const SizedBox(height: AppDimensions.xl),

                    HomeCategoriesWidget(
                      isLoading: isCategoriesLoading,
                      items: state.categories,
                    ),

                    const SizedBox(height: AppDimensions.xxxl),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
