import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final TimerController _timerController;

  MainBlocFactory({required TimerController timerController}) :
    _timerController = timerController;

  MainBloc create() => MainBloc(timerController: _timerController);
}