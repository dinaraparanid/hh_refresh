import 'dart:async';
import 'package:hh_refresh/core/utils/functions/time.dart';

final class TimerController {
  static const _timestampRefreshDuration = Duration(milliseconds: 500);
  StreamController<int>? _timestampController;
  StreamSubscription<int>? _timestampSubscription;

  void execute({
    required void Function(int timestamp) updateTimestamp,
  }) {
    disposeTimer();

    _timestampController = StreamController()..addStream(
      Stream.periodic(
        _timestampRefreshDuration,
      (_) => currentMillisSinceEpoch,
      ),
    );

    _timestampSubscription = _timestampController?.stream.listen(updateTimestamp);
  }

  void disposeTimer() {
    _timestampSubscription?.pause();
    _timestampSubscription?.cancel();
    _timestampSubscription = null;

    _timestampController?.close();
    _timestampController = null;
  }
}
