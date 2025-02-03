import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';

final class ClockProgressPainter extends CustomPainter {
  final double progress;
  final double clockRadius;
  final AppTheme theme;

  ClockProgressPainter({
    required this.progress,
    required this.clockRadius,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final commonPaint = Paint()
      ..strokeWidth = theme.dimensions.size.line.big
      ..style = PaintingStyle.stroke;

    final totalPaint = Paint.from(commonPaint)..color = theme.colors.secondary;
    final progressPaint = Paint.from(commonPaint)..color = theme.colors.primary;

    final center = Offset(clockRadius, clockRadius);
    final rect = Rect.fromCircle(center: center, radius: clockRadius);
    final startAngle = math.pi * 1.5;
    final endAngle = 2 * math.pi * progress;
    final useCenter = false;

    canvas.drawCircle(center, clockRadius, totalPaint);
    canvas.drawArc(rect, startAngle, endAngle, useCenter, progressPaint);
  }

  @override
  bool shouldRepaint(covariant ClockProgressPainter oldDelegate) {
    if (oldDelegate.clockRadius != clockRadius) return true;
    if (oldDelegate.progress != clockRadius) return true;
    if (oldDelegate.theme != theme) return true;
    return false;
  }
}
