sealed class MainEvent {}

final class WebClick extends MainEvent {}

final class StopClick extends MainEvent {}

final class RestartClick extends MainEvent {}

final class ResetTimer extends MainEvent {
  final int nextTimestamp;
  ResetTimer({required this.nextTimestamp});
}

final class UpdateCurrentTimestamp extends MainEvent {
  final int currentTimestamp;
  UpdateCurrentTimestamp({required this.currentTimestamp});
}

final class OnPause extends MainEvent {}

final class OnResume extends MainEvent {}
