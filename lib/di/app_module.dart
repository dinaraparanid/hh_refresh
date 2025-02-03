import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/core_module.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/feature/main/di/main_module.dart';
import 'package:hh_refresh/feature/onboarding/di/onboarding_module.dart';
import 'package:hh_refresh/feature/root/di/root_module.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  List<Type> registerAppModule() => [
    ...registerCoreModule(),
    ...registerRootModule(),
    ...registerOnboardingModule(),
    ...registerMainModule(),
    provideSingleton<AppRouter>(() => AppRouter()),
  ];
}
