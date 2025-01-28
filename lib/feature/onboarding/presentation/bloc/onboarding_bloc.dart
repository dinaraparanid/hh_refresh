import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/onboarding/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class OnboardingBloc extends Bloc<OnboardingEvent, void> {
  OnboardingBloc({
    required AppRouter router,
    required MarkIntroAsSeenUseCase markIntroAsSeenUseCase,
    required void Function() onOnboardingFinished,
  }) : super(null) {
    on<BeginButtonClick>((_, __) {
      markIntroAsSeenUseCase.execute();
      onOnboardingFinished();
    });
  }
}
