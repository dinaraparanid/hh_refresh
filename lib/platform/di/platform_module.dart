import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/platform/notification_handler/cv_notification_manager_factory.dart';

extension PlatformModule on GetIt {
  List<Type> registerPlatformModule() => [
    provideSingleton<CVNotificationManagerFactory>(() =>
      CVNotificationManagerFactory(),
    ),
  ];
}
