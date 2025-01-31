import 'package:permission_handler/permission_handler.dart';

final class RequestNotificationPermissionUseCase {
  Future<void>? execute({
    required void Function() onDenied,
    required void Function() onReady,
  }) async {
    final status = await Permission.notification.request();

    switch (status) {
      case PermissionStatus.denied: onDenied();
      case PermissionStatus.granted: onReady();
      case PermissionStatus.restricted: onDenied();
      case PermissionStatus.limited: onDenied();
      case PermissionStatus.permanentlyDenied: onDenied();
      case PermissionStatus.provisional: onReady();
    }
  }
}
