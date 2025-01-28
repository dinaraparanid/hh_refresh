import 'package:hh_refresh/feature/onboarding/domain/mark_intro_as_seen_use_case.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class OnboardingBlocFactory {
  final AppRouter _router;
  final MarkIntroAsSeenUseCase _markIntroAsSeenUseCase;

  OnboardingBlocFactory({
    required AppRouter router,
    required MarkIntroAsSeenUseCase markIntroAsSeenUseCase,
  }) : _router = router, _markIntroAsSeenUseCase = markIntroAsSeenUseCase;

  OnboardingBloc create({
    required void Function() onOnboardingFinished,
  }) => OnboardingBloc(
    router: _router,
    markIntroAsSeenUseCase: _markIntroAsSeenUseCase,
    onOnboardingFinished: onOnboardingFinished,
  );
}
