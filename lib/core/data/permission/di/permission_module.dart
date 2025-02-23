import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/core/domain/permission/request_notification_persmission_use_case.dart';

extension PermissionModule on GetIt {
  List<Type> registerPermissionModule() => [
    provideSingleton<RequestNotificationPermissionUseCase>(
      () => RequestNotificationPermissionUseCase(),
    ),
  ];
}
