import 'package:hh_refresh/feature/onboarding/child/scene1/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/onboarding_scene_1_bloc.dart';

final class OnboardingScene1BlocFactory {
  final MarkIntroAsSeenUseCase _markIntroAsSeenUseCase;

  OnboardingScene1BlocFactory({
    required MarkIntroAsSeenUseCase markIntroAsSeenUseCase,
  }) : _markIntroAsSeenUseCase = markIntroAsSeenUseCase;

  OnboardingScene1Bloc create({required void Function() onResult}) =>
    OnboardingScene1Bloc(
      markIntroAsSeenUseCase: _markIntroAsSeenUseCase,
      onResult: onResult,
    );
}
