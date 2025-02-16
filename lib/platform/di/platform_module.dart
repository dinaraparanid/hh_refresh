import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide.dart';
import 'package:hh_refresh/platform/notification_handler/cv_notification_handler.dart';
import 'package:hh_refresh/platform/notification_handler/cv_notification_handler_factory.dart';
import 'package:hh_refresh/platform/work_manager/cv_work_manager.dart';
import 'package:hh_refresh/platform/work_manager/cv_work_manager_factory.dart';

extension PlatformModule on GetIt {
  List<Type> registerPlatformModule() => [
    provideSingleton<CVNotificationHandlerFactory>(() =>
      CVNotificationHandlerFactory(),
    ),
    provideSingleton<CVWorkManagerFactory>(() =>
      CVWorkManagerFactory(),
    ),
  ];
}
