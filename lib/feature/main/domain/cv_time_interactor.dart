import 'package:hh_refresh/core/domain/cv/repository/cv_repository.dart';
import 'package:hh_refresh/platform/notification_handler/cv_notification_manager_factory.dart';

final class CVTimeInteractor {
  final CVRepository _cvRepository;
  final CVNotificationManagerFactory _cvNotificationManagerFactory;
  late final _cvNotificationManager = _cvNotificationManagerFactory.create();

  CVTimeInteractor({
    required CVRepository cvRepository,
    required CVNotificationManagerFactory cvNotificationManagerFactory,
  }) : _cvRepository = cvRepository,
    _cvNotificationManagerFactory = cvNotificationManagerFactory;

  Future<void> updateCVPromotionTime() =>
    _cvRepository.updateCVPromotionTime();

  Future<void> launchTimerBackgroundTask() async {
    await _cvNotificationManager.cancelCVNotification();
    await _cvNotificationManager.showCVNotification();
  }

  Future<void> cancelTimerBackgroundTask() =>
    _cvNotificationManager.cancelCVNotification();

  Stream<int?> get nextTimestampChanges =>
    _cvRepository
      .cvChanges
      .map((cv) => cv?.promotionExpiresTimestamp)
      .distinct();
}
