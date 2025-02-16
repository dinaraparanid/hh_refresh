import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';
import 'package:hh_refresh/l10n/app_localizations.dart';

final class ClockText extends StatelessWidget {
  const ClockText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            state.untilFormatted,
            style: theme.typography.h.h2.copyWith(
              color: theme.colors.text,
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            _clockSubtext(state: state, strings: strings),
            style: theme.typography.regular.copyWith(
              color: theme.colors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _clockSubtext({
    required MainState state,
    required AppLocalizations strings,
  }) {
    if (state.isTimerNeverLaunched) return strings.main_not_started;
    if (state.isTimerRunning) return strings.main_until_timeout;
    return strings.main_time_is_up;
  }
}
