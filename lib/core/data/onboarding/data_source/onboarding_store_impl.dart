import 'package:hh_refresh/core/domain/onboarding/data_source/onboarding_store.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class OnboardingStoreImpl with OnboardingStore {
  static const _keyOnboardingShown = 'onboarding_shown';

  @override
  Future<bool> get wasOnboardingOnceShown =>
    RxSharedPreferences
      .getInstance()
      .getBool(_keyOnboardingShown)
      .then((v) => v ?? false);
}
