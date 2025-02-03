import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
import 'package:hh_refresh/core/utils/functions/time.dart';
import 'package:hh_refresh/feature/main/domain/timer_controller.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_event.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required TimerController timerController,
  }) : super(MainState()) {

    on<WebClick>((event, emit) {

    });

    on<StopClick>((event, emit) {

    });

    on<RestartClick>((event, emit) {

    });

    on<UpdateCurrentTimestamp>((event, emit) =>
      emit(state.copyWith(currentTimestamp: event.currentTimestamp)),
    );

    on<ResetTimer>((event, emit) {
      emit(
        state.copyWith(
          nextTimestamp: event.nextTimestamp,
          currentTimestamp: currentMillisSinceEpoch,
        ),
      );

      timerController.execute(updateTimestamp: (ts) =>
        add(UpdateCurrentTimestamp(currentTimestamp: ts)),
      );
    });

    on<OnPause>((event, emit) => timerController.disposeTimer());

    on<OnResume>((event, emit) =>
      state.nextTimestamp?.let((ts) => add(ResetTimer(nextTimestamp: ts))),
    );
  }
}
