import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/data/onboarding/data_source/onboarding_store_impl.dart';
import 'package:hh_refresh/core/data/onboarding/repository/onboarding_repository_impl.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/core/domain/onboarding/data_source/onboarding_store.dart';
import 'package:hh_refresh/core/domain/onboarding/repository/onboarding_repository.dart';

extension OnboardingModule on GetIt {
  List<Type> registerOnboardingModule() => [
    provideSingleton<OnboardingStore>(() => OnboardingStoreImpl()),
    provideSingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(store: this()),
    ),
  ];
}
