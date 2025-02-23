import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/data/cv/di/cv_module.dart';
import 'package:hh_refresh/core/data/onboarding/di/onboarding_module.dart';
import 'package:hh_refresh/core/data/permission/di/permission_module.dart';

extension CoreModule on GetIt {
  List<Type> registerCoreModule() => [
    ...registerOnboardingModule(),
    ...registerCVModule(),
    ...registerPermissionModule(),
  ];
}
