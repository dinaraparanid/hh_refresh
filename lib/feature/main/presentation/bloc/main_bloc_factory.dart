import 'package:hh_refresh/feature/main/domain/cv_time_interactor.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final TimerController _timerController;
  final CVTimeInteractor _cvTimeInteractor;

  MainBlocFactory({
    required TimerController timerController,
    required CVTimeInteractor cvTimeInteractor,
  }) : _timerController = timerController,
    _cvTimeInteractor = cvTimeInteractor;

  MainBloc create() => MainBloc(
    timerController: _timerController,
    cvTimeInteractor: _cvTimeInteractor,
  );
}