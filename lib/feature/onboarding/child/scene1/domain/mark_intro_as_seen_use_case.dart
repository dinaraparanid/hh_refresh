import 'package:hh_refresh/core/domain/onboarding/repository/onboarding_repository.dart';

final class MarkIntroAsSeenUseCase {
  final OnboardingRepository _repository;

  MarkIntroAsSeenUseCase({required OnboardingRepository repository}) :
    _repository = repository;

  Future<void> execute() => _repository.markOnboardingAsShown();
}
