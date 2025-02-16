import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
import 'package:hh_refresh/core/utils/functions/time.dart';
import 'package:hh_refresh/feature/main/domain/cv_time_interactor.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_event.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_state.dart';
import 'package:hh_refresh/platform/notification_handler/cv_notification_handler.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required TimerController timerController,
    required CVTimeInteractor cvTimeInteractor,
  }) : super(MainState()) {

    on<WebClick>((event, emit) {

    });

    on<StopClick>((event, emit) {
      timerController.disposeTimer();
      cvTimeInteractor.cancelTimerBackgroundTask();
    });

    on<RestartClick>((event, emit) =>
      cvTimeInteractor.updateCVPromotionTime(),
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

    cvTimeInteractor
      .nextTimestampChanges
      .listen((timestamp) => add(ResetTimer(nextTimestamp: timestamp)));
  }
}
