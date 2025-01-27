import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_bloc.dart';
import 'package:hh_refresh/feature/root/presentation/root_screen.dart';
import 'package:hh_refresh/navigation/app_route.dart';

final class AppRouter {
  late final router = GoRouter(
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
        builder: (context, state) => Text('TODO: Intro screen'),
      ),
      GoRoute(
        path: AppRoute.main.path,
        name: AppRoute.main.name,
        builder: (context, state) => Text('TODO: Main screen'),
      ),
    ]
  );
}
