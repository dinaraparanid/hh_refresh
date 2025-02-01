import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:hh_refresh/core/utils/extensions/duration_ext.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
import 'package:hh_refresh/core/utils/functions/time.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    int? nextTimestamp,
  }) = _MainState;
}

extension Properties on MainState {
  bool get isTimerRunning => nextTimestamp
    ?.let((it) => currentMillisSinceEpoch > it)
    ?? false;

  String get untilFormatted {
    if (isTimerRunning.not) return '00:00:00';
    final distanceMs = currentMillisSinceEpoch - nextTimestamp!;
    return Duration(milliseconds: distanceMs).formatHHMMSS;
  }
}
