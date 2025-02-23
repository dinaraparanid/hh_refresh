import 'dart:io';

import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:permission_handler/permission_handler.dart';

final class RequestNotificationPermissionUseCase {
  Future<void>? execute({
    required void Function() onDenied,
    required void Function() onReady,
  }) async {
    bool handleStatus(PermissionStatus status) => switch (status) {
      PermissionStatus.denied => false,
      PermissionStatus.granted => true,
      PermissionStatus.restricted => false,
      PermissionStatus.limited => false,
      PermissionStatus.permanentlyDenied => false,
      PermissionStatus.provisional => true,
    };

    if (handleStatus(await Permission.notification.request()).not) {
      onDenied();
      return;
    }

    if (Platform.isAndroid &&
        handleStatus(await Permission.scheduleExactAlarm.request()).not
    ) {
      onDenied();
      return;
    }

    onReady();
  }
}
