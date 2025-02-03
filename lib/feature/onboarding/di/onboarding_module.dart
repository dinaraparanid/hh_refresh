import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/di/onboarding_scene_1_module.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/di/onboarding_scene_2_module.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc_factory.dart';

extension OnboardingModule on GetIt {
  List<Type> registerOnboardingModule() => [
    ...registerOnboardingScene1Module(),
    ...registerOnboardingScene2Module(),
    provideSingleton<OnboardingBlocFactory>(() =>
      OnboardingBlocFactory(
        router: this(),
        scene1blocFactory: this(),
        scene2blocFactory: this(),
      ),
    ),
  ];
}
