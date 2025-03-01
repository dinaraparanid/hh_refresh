sealed class MainEvent {}

final class WebClick extends MainEvent {}

final class StopClick extends MainEvent {}

final class RestartClick extends MainEvent {}

final class ResetTimer extends MainEvent {
  final int? nextTimestamp;
  ResetTimer({required this.nextTimestamp});
}

final class UpdateCurrentTimestamp extends MainEvent {
  final int currentTimestamp;
  UpdateCurrentTimestamp({required this.currentTimestamp});
}

final class OnPause extends MainEvent {}

final class OnResume extends MainEvent {}

final class ChangeFailedToOpenBrowserDialogVisibility extends MainEvent {
  final bool isVisible;
  ChangeFailedToOpenBrowserDialogVisibility({required this.isVisible});
}

final class ChangeNotificationDeniedDialogVisibility extends MainEvent {
  final bool isVisible;
  ChangeNotificationDeniedDialogVisibility({required this.isVisible});
}

final class ShowAppSettings extends MainEvent {}
