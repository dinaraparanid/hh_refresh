import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:hh_refresh/core/utils/functions/produce_if.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/main/presentation/widget/clock/clock.dart';
import 'package:hh_refresh/feature/main/presentation/widget/main_button.dart';

final class MainContent extends StatelessWidget {
  final void Function(MainEvent) onEvent;
  const MainContent({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) => BlocBuilder<MainBloc, MainState>(
    builder: (context, state) {
      final theme = context.appTheme;
      final strings = context.strings;

      return IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Clock(),

            SizedBox(height: theme.dimensions.padding.extraMedium),

            MainButton(
              iconSvg: 'ic_web',
              text: strings.main_open,
              onPressed: () => onEvent(WebClick()),
            ),

            SizedBox(height: theme.dimensions.padding.extraMedium),

            ProduceIf(
              condition: state.isTimerRunning,
              builder: () => MainButton(
                iconSvg: 'ic_stop',
                text: strings.main_stop,
                onPressed: () => onEvent(StopClick()),
              ),
            ),

            ProduceIf(
              condition: state.isTimerRunning.not,
              builder: () => MainButton(
                iconSvg: 'ic_clock',
                text: strings.main_restart_timer,
                onPressed: () => onEvent(RestartClick()),
              ),
            ),
          ].whereType<Widget>().toList(growable: false),
        ),
      );
    }
  );
}