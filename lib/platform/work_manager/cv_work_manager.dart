import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void cvWorkManagerCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // TODO show notification
    return true;
  });
}

final class CVWorkManager {
  static const _promoteCVTask = 'promote-cv-task';
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
