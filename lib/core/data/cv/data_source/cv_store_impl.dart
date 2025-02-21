import 'dart:convert';
import 'package:hh_refresh/core/domain/cv/data_store/cv_store.dart';
import 'package:hh_refresh/core/domain/cv/entity/cv.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
import 'package:hh_refresh/feature/main/domain/clock_config.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class CVStoreImpl with CVStore {
  static const _keyCV = 'cv';

  @override
  Stream<CV?> get cvChanges =>
    RxSharedPreferences
      .getInstance()
      .getStringStream(_keyCV)
      .map((str) => str?.let((s) => CV.fromJson(jsonDecode(s))))
      .distinct();

  @override
  Future<void> storeCV({required CV cv}) =>
    RxSharedPreferences
      .getInstance()
      .setString(_keyCV, jsonEncode(cv.toJson()));

  @override
  Future<void> updateCVPromotionTime() async {
    final prefs = RxSharedPreferences.getInstance();
    final jsonString = await prefs.getString(_keyCV);
    final prevCV = jsonString?.let((s) => CV.fromJson(jsonDecode(s)));

    final nextTimestamp = DateTime.now()
      .add(ClockConfig.fullDuration)
      .millisecondsSinceEpoch;

    final nextCV = prevCV
      ?.copyWith(promotionExpiresTimestamp: nextTimestamp)
      ?? CV(promotionExpiresTimestamp: nextTimestamp);

    await prefs.setString(_keyCV, jsonEncode(nextCV.toJson()));
  }
}
