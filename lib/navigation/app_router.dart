import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hh_refresh/navigation/app_route.dart';

final class AppRouter {
  late final router = GoRouter(
    initialLocation: AppRoute.intro.path,
    routes: [
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
