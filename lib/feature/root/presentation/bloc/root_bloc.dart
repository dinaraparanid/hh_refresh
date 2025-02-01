import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/root/domain/entity/root_screen.dart';
import 'package:hh_refresh/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_event.dart';
import 'package:hh_refresh/navigation/app_route.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  final OnboardingBlocFactory _onboardingBlocFactory;
  final MainBlocFactory _mainBlocFactory;

  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required OnboardingBlocFactory onboardingBlocFactory,
    required MainBlocFactory mainBlocFactory,
  }) : _onboardingBlocFactory = onboardingBlocFactory,
    _mainBlocFactory = mainBlocFactory,
    super(null) {
    on<NavigateToOnboarding>((event, emit) {
      final bloc = _createOnboardingBloc();
      router.value.replaceNamed(AppRoute.intro.name, extra: bloc);
    });

    on<NavigateToMain>((event, emit) {
      final bloc = _createMainBloc();
      router.value.replaceNamed(AppRoute.main.name, extra: bloc);
    });

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootScreen.onboarding => add(NavigateToOnboarding()),
        RootScreen.main => add(NavigateToMain()),
      });
  }

  OnboardingBloc _createOnboardingBloc() => _onboardingBlocFactory.create(
    onDone: () => add(NavigateToMain()),
  );

  MainBloc _createMainBloc() => _mainBlocFactory.create();
}