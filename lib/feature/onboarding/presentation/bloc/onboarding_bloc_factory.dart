import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class OnboardingBlocFactory {
  final OnboardingScene1BlocFactory _scene1blocFactory;
  final OnboardingScene2BlocFactory _scene2blocFactory;
  final AppRouter _router;

  OnboardingBlocFactory({
    required AppRouter router,
    required OnboardingScene1BlocFactory scene1blocFactory,
    required OnboardingScene2BlocFactory scene2blocFactory,
  }) : _router = router,
    _scene1blocFactory = scene1blocFactory,
    _scene2blocFactory = scene2blocFactory;

  OnboardingBloc create({required void Function() onDone}) => OnboardingBloc(
    scene1Factory: _scene1blocFactory,
    scene2Factory: _scene2blocFactory,
    router: _router,
    onDone: onDone,
  );
}
