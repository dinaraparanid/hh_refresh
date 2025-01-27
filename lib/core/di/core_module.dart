import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/data/onboarding/di/onboarding_module.dart';

extension CoreModule on GetIt {
  List<Type> registerCoreModule() => [
    ...registerOnboardingModule(),
  ];
}
