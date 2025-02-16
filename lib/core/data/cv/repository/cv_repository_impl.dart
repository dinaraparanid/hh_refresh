import 'package:hh_refresh/core/domain/cv/data_store/cv_store.dart';
import 'package:hh_refresh/core/domain/cv/entity/cv.dart';
import 'package:hh_refresh/core/domain/cv/repository/cv_repository.dart';

final class CVRepositoryImpl extends CVRepository {
  final CVStore _store;

  CVRepositoryImpl({
    required CVStore store,
  }) : _store = store;

  @override
  Stream<CV?> get cvChanges => _store.cvChanges;

  @override
  Future<void> storeCV({required CV cv}) => _store.storeCV(cv: cv);

  @override
  Future<void> updateCVPromotionTime() => _store.updateCVPromotionTime();
}
