import 'package:freezed_annotation/freezed_annotation.dart';

part 'cv.freezed.dart';
part 'cv.g.dart';

@freezed
abstract class CV with _$CV {
  const factory CV({
    String? url,
    int? promotionExpiresTimestamp,
  }) = _CV;

  factory CV.fromJson(Map<String, dynamic> json) => _$CVFromJson(json);
}
