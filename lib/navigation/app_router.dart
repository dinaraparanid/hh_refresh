import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';
import 'package:hh_refresh/feature/main/presentation/main_screen.dart';
import 'package:hh_refresh/navigation/screens.dart';
import 'package:hh_refresh/navigation/app_route.dart';

final class AppRouter {
  late final value = GoRouter(
    initialLocation: AppRoute.root.path,
    routes: [
      GoRoute(
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        builder: (context, state) => RootScreen(bloc: context.read<RootBloc>()),
      ),
      GoRoute(
        path: AppRoute.intro.path,
        name: AppRoute.intro.name,
        builder: (context, state) => OnboardingScreen(bloc: state.extra as OnboardingBloc),
      ),
      GoRoute(
        path: AppRoute.intro1.path,
        name: AppRoute.intro1.name,
        builder: (context, state) => OnboardingScene1(bloc: state.extra as OnboardingScene1Bloc),
      ),
      GoRoute(
        path: AppRoute.intro2.path,
        name: AppRoute.intro2.name,
        builder: (context, state) => OnboardingScene2(bloc: state.extra as OnboardingScene2Bloc),
      ),
      GoRoute(
        path: AppRoute.main.path,
        name: AppRoute.main.name,
        builder: (context, state) => MainScreen(bloc: state.extra as MainBloc),
      ),
    ],
  );
}
