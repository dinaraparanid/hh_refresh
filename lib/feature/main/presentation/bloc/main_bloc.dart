import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/domain/permission/request_notification_persmission_use_case.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
import 'package:hh_refresh/core/utils/functions/time.dart';
import 'package:hh_refresh/feature/main/domain/cv_time_interactor.dart';
import 'package:hh_refresh/feature/main/domain/open_cv_in_browser_use_case.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_event.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_state.dart';
import 'package:permission_handler/permission_handler.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required TimerController timerController,
    required CVTimeInteractor cvTimeInteractor,
    required OpenCVInBrowserUseCase openCVInBrowserUseCase,
    required RequestNotificationPermissionUseCase requestNotificationPermissionUseCase,
  }) : super(MainState()) {

    on<WebClick>((event, emit) {
      openCVInBrowserUseCase.execute(onFailure:
        () => add(ChangeFailedToOpenBrowserDialogVisibility(isVisible: true)),
      );
    });

    on<StopClick>((event, emit) {
      timerController.disposeTimer();
      cvTimeInteractor.cancelTimerBackgroundTask();
    });

    on<RestartClick>((event, emit) =>
      requestNotificationPermissionUseCase.execute(
        onDenied: () => add(ChangeNotificationDeniedDialogVisibility(isVisible: true)),
        onReady: () => cvTimeInteractor.updateCVPromotionTime(),
      )
    );

    on<UpdateCurrentTimestamp>((event, emit) =>
      emit(state.copyWith(currentTimestamp: event.currentTimestamp)),
    );

    on<ResetTimer>((event, emit) {
      final timestamp = event.nextTimestamp;

      if (timestamp == null || timestamp == MainState.timestampNeverSet) {
        emit(state.copyWith(nextTimestamp: MainState.timestampNeverSet));
        return;
      }

      emit(
        state.copyWith(
          nextTimestamp: timestamp,
          currentTimestamp: currentMillisSinceEpoch,
        ),
      );

      timerController.execute(updateTimestamp: (ts) =>
        add(UpdateCurrentTimestamp(currentTimestamp: ts)),
      );

      cvTimeInteractor.launchTimerBackgroundTask();
    });

    on<OnPause>((event, emit) => timerController.disposeTimer());

    on<OnResume>((event, emit) =>
      state.nextTimestamp?.let((ts) => add(ResetTimer(nextTimestamp: ts))),
    );

    on<ChangeFailedToOpenBrowserDialogVisibility>((event, emit) =>
      emit(state.copyWith(isFailedToOpenBrowserDialogShown: event.isVisible)),
    );

    on<ChangeNotificationDeniedDialogVisibility>((event, emit) =>
      emit(state.copyWith(isNotificationDeniedShown: event.isVisible)),
    );

    on<ShowAppSettings>((event, emit) {
      emit(state.copyWith(isNotificationDeniedShown: false));
      openAppSettings();
    });

    cvTimeInteractor
      .nextTimestampChanges
      .listen((timestamp) => add(ResetTimer(nextTimestamp: timestamp)));
  }
}
