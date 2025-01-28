import 'package:flutter/material.dart';

const _Black = Colors.black;
const _White = Colors.white;
const _VenetianRed = Color(0xFFD20A11);
const _Cultured = Color(0xFFF2F4FA);

@immutable
final class AppColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color text;
  final AppButtonColors button;
  final AppIconColors icon;

  const AppColors({
    required this.secondary,
    required this.background,
    required this.text,
    this.primary = _VenetianRed,
    this.button = const AppButtonColors(),
    this.icon = const AppIconColors(),
  });

  factory AppColors.lightTheme() => AppColors(
    secondary: _Black,
    background: _White,
    text: _Black,
  );

  factory AppColors.darkTheme() => AppColors(
    secondary: _White,
    background: _Black,
    text: _White,
  );
}

@immutable
final class AppButtonColors {
  final Color content;
  final Color background;

  const AppButtonColors({
    this.content = _Black,
    this.background = _Cultured,
  });
}

@immutable
final class AppIconColors {
  final Color primary;
  final Color secondary;

  const AppIconColors({
    this.primary = _White,
    this.secondary = _Black,
  });
}
