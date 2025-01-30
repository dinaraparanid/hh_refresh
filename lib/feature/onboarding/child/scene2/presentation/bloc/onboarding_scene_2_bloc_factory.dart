import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_bloc.dart';

final class OnboardingScene2BlocFactory {
  OnboardingScene2BlocFactory();

  OnboardingScene2Bloc create({required void Function() onResult}) =>
    OnboardingScene2Bloc(onResult: onResult);
}
