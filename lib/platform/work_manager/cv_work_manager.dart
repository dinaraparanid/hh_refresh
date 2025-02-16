import 'package:hh_refresh/platform/notification_handler/cv_notification_handler.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void cvWorkManagerCallbackDispatcher() =>
  Workmanager().executeTask((task, inputData) async {
    CVNotificationHandler().showCVNotification();
    return true;
  });

final class CVWorkManager {
  static const _promoteCVTask = 'task-cv-promote';
  static const fullDuration = Duration(hours: 4);

  CVWorkManager() {
    Workmanager().initialize(cvWorkManagerCallbackDispatcher);
  }

  Future<void> registerPromoteCVTask() => Workmanager().registerOneOffTask(
    _promoteCVTask, _promoteCVTask,
    existingWorkPolicy: ExistingWorkPolicy.replace,
    initialDelay: Duration(hours: 4),
  );

  Future<void> cancelPromoteCVTask() =>
    Workmanager().cancelByUniqueName(_promoteCVTask);
}
