import 'package:hh_refresh/platform/work_manager/cv_work_manager.dart';

final class CVWorkManagerFactory {
  static CVWorkManager? _instance;
  CVWorkManager create() => _instance ??= CVWorkManager();
}
