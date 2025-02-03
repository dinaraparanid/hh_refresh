import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_bloc_factory.dart';

extension RootModule on GetIt {
  List<Type> registerRootModule() => [
    provideSingleton<InitialScreenUseCase>(() =>
      InitialScreenUseCase(repository: this()),
    ),
    provideSingleton<RootBlocFactory>(() =>
      RootBlocFactory(
        router: this(),
        initialScreenUseCase: this(),
        onboardingBlocFactory: this(),
        mainBlocFactory: this(),
      ),
    ),
  ];
}