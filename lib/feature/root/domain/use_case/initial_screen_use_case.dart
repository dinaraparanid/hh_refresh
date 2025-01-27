import 'package:hh_refresh/core/domain/onboarding/repository/onboarding_repository.dart';
import 'package:hh_refresh/feature/root/domain/entity/root_screen.dart';

final class InitialScreenUseCase {
  final OnboardingRepository _repository;

  InitialScreenUseCase({
    required OnboardingRepository repository,
  }) : _repository = repository;

  Future<RootScreen> get initialScreen =>
    _repository
        .wasOnboardingOnceShown
        .then((wasShown) => wasShown ? RootScreen.main : RootScreen.onboarding);
}
