import 'package:hh_refresh/core/domain/onboarding/data_source/onboarding_store.dart';
import 'package:hh_refresh/core/domain/onboarding/repository/onboarding_repository.dart';

final class OnboardingRepositoryImpl extends OnboardingRepository {
  final OnboardingStore _store;

  OnboardingRepositoryImpl({
    required OnboardingStore store,
  }) : _store = store;

  @override
  Future<bool> get wasOnboardingOnceShown => _store.wasOnboardingOnceShown;

  @override
  Future<void> markOnboardingAsShown() => _store.markOnboardingAsShown();
}
