// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'hh.refresh';

  @override
  String get begin => 'Begin';

  @override
  String get continue_ => 'Continue';

  @override
  String get allow => 'Allow';

  @override
  String get deny => 'Deny';

  @override
  String get onboarding_scene_1_title => 'Welcome to hh.refresh!';

  @override
  String get onboarding_scene_1_description => 'This app helps to promote your CV by reminding you to bring it up in the search';

  @override
  String get onboarding_scene_2_title => 'Start to promote your CV';

  @override
  String get onboarding_scene_2_description => 'The app will start a timer, after which you will receive a notification';

  @override
  String get notifications_denied_dialog_title => 'Notifications';

  @override
  String get notifications_denied_dialog_description => 'Allow notifications to be used so that the app reminds you to bring up your resume at the same time.';

  @override
  String get main_open => 'Open';

  @override
  String get main_stop => 'Stop';

  @override
  String get main_restart_timer => 'Restart timer';

  @override
  String get main_until_timeout => 'Until timeout';

  @override
  String get main_time_is_up => 'Time is up';

  @override
  String get notification_cv_title => 'Promote your CV';
}
