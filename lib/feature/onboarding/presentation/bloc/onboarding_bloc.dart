import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:hh_refresh/navigation/mod.dart';

final class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingScene1BlocFactory _scene1Factory;
  final OnboardingScene2BlocFactory _scene2Factory;
  final void Function() _onDone;

  OnboardingBloc({
    required OnboardingScene1BlocFactory scene1Factory,
    required OnboardingScene2BlocFactory scene2Factory,
    required AppRouter router,
    required void Function() onDone,
  }) : _scene1Factory = scene1Factory,
    _scene2Factory = scene2Factory,
    _onDone = onDone,
    super(OnboardingState()) {

    on<ShowScene1>(
      (event, emit) => router.value.replaceNamed(
        AppRoute.intro1.name,
        extra: _createScene1Bloc(),
      ),
    );

    on<ShowScene2>(
      (event, emit) => router.value.replaceNamed(
        AppRoute.intro2.name,
        extra: _createScene2Bloc(),
      ),
    );

    add(ShowScene1());
  }

  OnboardingScene1Bloc _createScene1Bloc() => _scene1Factory.create(
    onResult: () => add(ShowScene2()),
  );

  OnboardingScene2Bloc _createScene2Bloc() => _scene2Factory.create(
    onResult: _onDone,
  );
}
