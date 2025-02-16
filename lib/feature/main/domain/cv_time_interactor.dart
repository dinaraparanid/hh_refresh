import 'package:hh_refresh/core/domain/cv/repository/cv_repository.dart';
import 'package:hh_refresh/platform/work_manager/cv_work_manager_factory.dart';

final class CVTimeInteractor {
  final CVRepository _cvRepository;
  final CVWorkManagerFactory _cvWorkManagerFactory;

  CVTimeInteractor({
    required CVRepository cvRepository,
    required CVWorkManagerFactory cvWorkManagerFactory,
  }) : _cvRepository = cvRepository,
    _cvWorkManagerFactory = cvWorkManagerFactory;

  Future<void> updateCVPromotionTime() =>
    _cvRepository.updateCVPromotionTime();

  Future<void> launchTimerBackgroundTask() async {
    final workManager = _cvWorkManagerFactory.create();
    await workManager.cancelPromoteCVTask();
    await workManager.registerPromoteCVTask();
  }

  Future<void> cancelTimerBackgroundTask() async {
    final workManager = _cvWorkManagerFactory.create();
    await workManager.cancelPromoteCVTask();
  }

  Stream<int?> get nextTimestampChanges =>
    _cvRepository
      .cvChanges
      .map((cv) => cv?.promotionExpiresTimestamp)
      .distinct();
}
