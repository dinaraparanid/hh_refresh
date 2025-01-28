mixin OnboardingStore {
  Future<bool> get wasOnboardingOnceShown;
  Future<void> markOnboardingAsShown();
}
