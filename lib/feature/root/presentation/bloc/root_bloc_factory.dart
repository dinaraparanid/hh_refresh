import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc_factory.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc_factory.dart';
import 'package:hh_refresh/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_bloc.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class RootBlocFactory {
  final AppRouter _router;
  final InitialScreenUseCase _initialScreenUseCase;
  final OnboardingBlocFactory _onboardingBlocFactory;
  final MainBlocFactory _mainBlocFactory;

  RootBlocFactory({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required OnboardingBlocFactory onboardingBlocFactory,
    required MainBlocFactory mainBlocFactory,
  }) : _router = router,
    _initialScreenUseCase = initialScreenUseCase,
    _onboardingBlocFactory = onboardingBlocFactory,
    _mainBlocFactory = mainBlocFactory;

  RootBloc create() => RootBloc(
    router: _router,
    initialScreenUseCase: _initialScreenUseCase,
    onboardingBlocFactory: _onboardingBlocFactory,
    mainBlocFactory: _mainBlocFactory,
  );
}
