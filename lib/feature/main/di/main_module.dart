import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/feature/main/domain/cv_time_interactor.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  List<Type> registerMainModule() => [
    provideFactory<TimerController>(() => TimerController()),

    provideSingleton<CVTimeInteractor>(
      () => CVTimeInteractor(
        cvRepository: this(),
        cvNotificationManagerFactory: this(),
      ),
    ),

    provideSingleton<MainBlocFactory>(
      () => MainBlocFactory(
        timerController: this(),
        cvTimeInteractor: this(),
      )
    ),
  ];
}
