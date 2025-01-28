import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide_singleton.dart';
import 'package:hh_refresh/feature/onboarding/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc_factory.dart';

extension OnboardingModule on GetIt {
  List<Type> registerOnboardingModule() => [
    provideSingleton<MarkIntroAsSeenUseCase>(() =>
      MarkIntroAsSeenUseCase(repository: this()),
    ),
    provideSingleton<OnboardingBlocFactory>(() =>
      OnboardingBlocFactory(
        router: this(),
        markIntroAsSeenUseCase: this(),
      ),
    ),
  ];
}
