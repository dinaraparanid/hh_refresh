import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/core/utils/functions/distinct_state.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/main/presentation/widget/clock/clock_progress_painter.dart';
import 'package:hh_refresh/feature/main/presentation/widget/clock/clock_text.dart';
import 'package:hh_refresh/platform/work_manager/cv_work_manager.dart';

final class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<StatefulWidget> createState() => _ClockState();
}

final class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  static const _clockRadius = 128.0;

  late AnimationController _progressController;
  late Tween<double> _progressTween;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: CVWorkManager.fullDuration,
    );

    _progressTween = Tween(begin: 0, end: 1);

    _progressAnimation = _progressTween.animate(_progressController);
  }

  @override
  void dispose() {
    super.dispose();
    _progressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocConsumer<MainBloc, MainState>(
      listenWhen: distinctState((x) => (x.currentTimestamp, x.nextTimestamp)),
      listener: (_, state) =>
        _progressController.forward(from: state.timerProgress),
      builder: (context, state) => Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, _) => CustomPaint(
              size: Size.square(_clockRadius * 2),
              painter: ClockProgressPainter(
                progress: _progressAnimation.value,
                clockRadius: _clockRadius,
                theme: theme,
              ),
            ),
          ),

          ClockText(),
        ],
      ),
    );
  }
}

