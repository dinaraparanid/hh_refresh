import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/onboarding_scene_1_event.dart';

final class OnboardingScene1Bloc extends Bloc<OnboardingScene1Event, void> {
  OnboardingScene1Bloc({
    required MarkIntroAsSeenUseCase markIntroAsSeenUseCase,
    required void Function() onResult,
  }) : super(null) {
    on<BeginClick>((_, __) {
      markIntroAsSeenUseCase.execute();
      onResult();
    });
  }
}
