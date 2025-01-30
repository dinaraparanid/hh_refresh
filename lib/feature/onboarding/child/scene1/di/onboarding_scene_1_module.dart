import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide_singleton.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/mod.dart';

extension OnboardingScene1Module on GetIt {
  List<Type> registerOnboardingScene1Module() => [
    provideSingleton<MarkIntroAsSeenUseCase>(
      () => MarkIntroAsSeenUseCase(repository: this()),
    ),
    provideSingleton<OnboardingScene1BlocFactory>(
      () => OnboardingScene1BlocFactory(
        markIntroAsSeenUseCase: this(),
      )
    ),
  ];
}
