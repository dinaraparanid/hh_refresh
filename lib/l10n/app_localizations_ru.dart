// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get app_name => 'hh.refresh';

  @override
  String get begin => 'Начать';

  @override
  String get continue_ => 'Продолжить';

  @override
  String get allow => 'Разрешить';

  @override
  String get deny => 'Нет, спасибо';

  @override
  String get onboarding_scene_1_title => 'Добро пожаловать в hh.refresh!';

  @override
  String get onboarding_scene_1_description => 'Это приложение помогает продвигать ваше резюме, напоминая, что срок подъема в поиске истек';

  @override
  String get onboarding_scene_2_title => 'Начните поднимать свое резюме';

  @override
  String get onboarding_scene_2_description => 'Приложение запустит таймер, по истечению которого вам придет уведомление';

  @override
  String get notifications_denied_dialog_title => 'Уведомления';

  @override
  String get notifications_denied_dialog_description => 'Разрешите использовать уведомления, чтобы приложение вовремя напоминало вам поднимать резюме';

  @override
  String get main_open => 'Перейти';

  @override
  String get main_stop => 'Остановить';

  @override
  String get main_start_timer => 'Запустить таймер';

  @override
  String get main_restart_timer => 'Перезапустить таймер';

  @override
  String get main_until_timeout => 'До следующего подъема';

  @override
  String get main_not_started => 'Не начат';

  @override
  String get main_time_is_up => 'Время вышло';

  @override
  String get notification_cv_title => 'Поднимите ваше резюме';
}
