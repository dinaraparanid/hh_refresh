import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/root/domain/entity/root_screen.dart';
import 'package:hh_refresh/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_event.dart';
import 'package:hh_refresh/navigation/app_route.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
  }) : super(null) {
    on<NavigateToOnboarding>((event, emit) =>
      // TODO: фабрика фрагмента
      router.router.replaceNamed(AppRoute.intro.name),
    );

    on<NavigateToMain>((event, emit) =>
      // TODO: фабрика фрагмента
      router.router.replaceNamed(AppRoute.main.name),
    );

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootScreen.onboarding => add(NavigateToOnboarding()),
        RootScreen.main => add(NavigateToMain()),
      });
  }
}