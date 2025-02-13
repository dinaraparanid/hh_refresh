import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:hh_refresh/core/utils/extensions/duration_ext.dart';
import 'package:hh_refresh/platform/work_manager/cv_work_manager.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    int? nextTimestamp,
    int? currentTimestamp,
  }) = _MainState;
}

extension Properties on MainState {
  bool get isTimerRunning {
    final next = nextTimestamp;
    final current = currentTimestamp;

    if (next == null || current == null) return false;
    return next > current;
  }

  double get timerProgress {
    final next = nextTimestamp;
    final current = currentTimestamp;
    final fullDurationMs = CVWorkManager.fullDuration.inMilliseconds;

    if (next == null || current == null || current >= next) return 1;
    return (fullDurationMs - next + current) / fullDurationMs;
  }

  String get untilFormatted {
    if (isTimerRunning.not) return '00:00:00';
    final distanceMs = nextTimestamp! - currentTimestamp!;
    return Duration(milliseconds: distanceMs).formatHHMMSS;
  }
}
