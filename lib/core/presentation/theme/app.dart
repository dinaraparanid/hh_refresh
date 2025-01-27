import 'package:flutter/cupertino.dart';
import 'package:hh_refresh/core/presentation/theme/colors.dart';
import 'package:hh_refresh/core/presentation/theme/dimensions.dart';
import 'package:hh_refresh/core/presentation/theme/theme.dart';
import 'package:hh_refresh/core/presentation/theme/typography.dart';

@immutable
final class AppTheme {
  final AppColors colors;
  final AppDimensions dimensions;
  final AppTypography typography;

  const AppTheme({
    required this.colors,
    this.dimensions = const AppDimensions(),
    this.typography = const AppTypography(),
  });

  factory AppTheme.create({required AppThemeColors theme}) => AppTheme(
    colors: switch (theme) {
      AppThemeColors.light => AppColors.lightTheme(),
      AppThemeColors.dark => AppColors.darkTheme(),
    },
  );
}
