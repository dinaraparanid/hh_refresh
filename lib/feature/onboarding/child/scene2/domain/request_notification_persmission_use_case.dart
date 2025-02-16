import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:permission_handler/permission_handler.dart';

final class RequestNotificationPermissionUseCase {
  Future<void>? execute({
    required void Function() onDenied,
    required void Function() onReady,
  }) async {
    bool handleStatus(PermissionStatus status) {
      switch (status) {
        case PermissionStatus.denied: onDenied(); return false;
        case PermissionStatus.granted: onReady(); return true;
        case PermissionStatus.restricted: onDenied(); return false;
        case PermissionStatus.limited: onDenied(); return false;
        case PermissionStatus.permanentlyDenied: onDenied(); return false;
        case PermissionStatus.provisional: onReady(); return true;
      }
    }

    if (handleStatus(await Permission.backgroundRefresh.request())) {
      handleStatus(await Permission.notification.request());
    }
  }
}
