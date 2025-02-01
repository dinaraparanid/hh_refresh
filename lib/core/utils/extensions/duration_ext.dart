extension DurationExt on Duration {
  String get formatHHMMSS => toString().split('.').first.padLeft(8, '0');
}
