import 'package:hh_refresh/core/domain/cv/entity/cv.dart';

mixin CVStore {
  Stream<CV?> get cvChanges;
  Future<void> storeCV({required CV cv});
  Future<void> updateCVPromotionTime();
  Future<void> resetCVPromotionTime();
}
