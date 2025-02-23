import 'package:hh_refresh/core/domain/permission/request_notification_persmission_use_case.dart';
import 'package:hh_refresh/feature/main/domain/cv_time_interactor.dart';
import 'package:hh_refresh/feature/main/domain/open_cv_in_browser_use_case.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final TimerController _timerController;
  final CVTimeInteractor _cvTimeInteractor;
  final OpenCVInBrowserUseCase _openCVInBrowserUseCase;
  final RequestNotificationPermissionUseCase _requestNotificationPermissionUseCase;

  MainBlocFactory({
    required TimerController timerController,
    required CVTimeInteractor cvTimeInteractor,
    required OpenCVInBrowserUseCase openCVInBrowserUseCase,
    required RequestNotificationPermissionUseCase requestNotificationPermissionUseCase,
  }) : _timerController = timerController,
    _cvTimeInteractor = cvTimeInteractor,
    _openCVInBrowserUseCase = openCVInBrowserUseCase,
    _requestNotificationPermissionUseCase = requestNotificationPermissionUseCase;

  MainBloc create() => MainBloc(
    timerController: _timerController,
    cvTimeInteractor: _cvTimeInteractor,
    openCVInBrowserUseCase: _openCVInBrowserUseCase,
    requestNotificationPermissionUseCase: _requestNotificationPermissionUseCase,
  );
}
