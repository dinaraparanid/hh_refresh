import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hh_refresh/l10n/app_localizations_ru.dart';

@pragma('vm:entry-point')
void onCVNotificationAction(NotificationResponse response) =>
  _onNotificationActionImpl(response);

void _onNotificationActionImpl(NotificationResponse response) {
  // TODO handle response
}

final class CVNotificationHandler {
  static const _notificationId = 0;
  static const _notificationChannelId = 'promote_cv';
  static const _notificationChannelName = 'Promote CV';
  static const _category = 'cv';
  static const _actionOpen = 'open';
  static const _actionRestart = 'restart';

  final _plugin = FlutterLocalNotificationsPlugin();
  final _strings = AppLocalizationsRu();

  CVNotificationHandler() {
    _plugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher'),
        iOS: _darwinSettings,
        macOS: _darwinSettings,
      ),
      onDidReceiveNotificationResponse: _onNotificationActionImpl,
      onDidReceiveBackgroundNotificationResponse: onCVNotificationAction
    );
  }

  Future<void> showCVNotification() => _plugin.show(
    _notificationId,
    _strings.notification_cv_title,
    null,
    NotificationDetails(
      android: _androidDetails,
      iOS: _darwinDetails,
      macOS: _darwinDetails,
    ),
  );

  DarwinInitializationSettings get _darwinSettings =>
    DarwinInitializationSettings(
      notificationCategories: [
        DarwinNotificationCategory(
          _category,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain(
              _actionOpen,
              _strings.main_open,
              options: { DarwinNotificationActionOption.foreground },
            ),
            DarwinNotificationAction.plain(
              _actionRestart,
              _strings.main_restart_timer,
            ),
          ],
        ),
      ],
    );

  DarwinNotificationDetails get _darwinDetails =>
    DarwinNotificationDetails(presentSound: true);

  AndroidNotificationDetails get _androidDetails =>
    AndroidNotificationDetails(_notificationChannelId, _notificationChannelName);
}
