import 'dart:convert';
import 'package:hh_refresh/core/domain/cv/data_store/cv_store.dart';
import 'package:hh_refresh/core/domain/cv/entity/cv.dart';
import 'package:hh_refresh/core/utils/functions/common.dart';
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
}
