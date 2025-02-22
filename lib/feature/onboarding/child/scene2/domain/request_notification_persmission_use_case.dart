import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:permission_handler/permission_handler.dart';

final class RequestNotificationPermissionUseCase {
  Future<void>? execute({
    required void Function() onDenied,
    required void Function() onReady,
  }) async {
    bool handleStatus(PermissionStatus status) {
      switch (status) {
        case PermissionStatus.denied: return false;
        case PermissionStatus.granted: return true;
        case PermissionStatus.restricted: return false;
        case PermissionStatus.limited: return false;
        case PermissionStatus.permanentlyDenied: return false;
        case PermissionStatus.provisional: return true;
      }
    }

    if (handleStatus(await Permission.notification.request()).not) {
      onDenied();
      return;
    }

    if (handleStatus(await Permission.scheduleExactAlarm.request()).not) {
      onDenied();
      return;
    }

    onReady();
  }
}
