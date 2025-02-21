import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hh_refresh/feature/main/domain/clock_config.dart';
import 'package:hh_refresh/l10n/app_localizations_ru.dart';
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point')
void onCVNotificationAction(NotificationResponse response) {
  // TODO handle response
}

void _onNotificationActionImpl(NotificationResponse response) {
  // TODO handle response
}

final class CVNotificationManager {
  static const _notificationId = 0;
  static const _notificationChannelId = 'promote_cv';
  static const _notificationChannelName = 'Promote CV';
  static const _category = 'cv';
  static const _actionOpen = 'open';
  static const _actionRestart = 'restart';

  final _plugin = FlutterLocalNotificationsPlugin();
  final _strings = AppLocalizationsRu();

  CVNotificationManager() {
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

  Future<void> showCVNotification() async {
    final scheduledTime = tz.TZDateTime.from(
      DateTime.now().add(ClockConfig.fullDuration),
      tz.local,
    );

    await _plugin.zonedSchedule(
      _notificationId,
      _strings.notification_cv_title,
      null,
      scheduledTime,
      NotificationDetails(
        android: _androidDetails,
        iOS: _darwinDetails,
        macOS: _darwinDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelCVNotification() => _plugin.cancel(_notificationId);

  DarwinInitializationSettings get _darwinSettings =>
    DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: [
        DarwinNotificationCategory(
          _category,
          actions: [
            DarwinNotificationAction.plain(
              _actionOpen,
              _strings.main_open,
              options: { DarwinNotificationActionOption.foreground },
            ),
            DarwinNotificationAction.plain(
              _actionRestart,
              _strings.main_restart_timer,
              options: { DarwinNotificationActionOption.foreground },
            ),
          ],
          options: { DarwinNotificationCategoryOption.hiddenPreviewShowTitle },
        ),
      ],
    );

  DarwinNotificationDetails get _darwinDetails =>
    DarwinNotificationDetails(presentSound: true);

  AndroidNotificationDetails get _androidDetails =>
    AndroidNotificationDetails(_notificationChannelId, _notificationChannelName);
}
