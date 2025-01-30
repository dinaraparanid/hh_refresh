import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_event.dart';

final class OnboardingScene2Bloc extends Bloc<OnboardingScene2Event, void> {
  OnboardingScene2Bloc({
    required void Function() onResult,
  }) : super(null) {
    on<ContinueClick>((_, __) {
      onResult();
    });
  }
}