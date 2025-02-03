import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';

final class UntilText extends StatelessWidget {
  const UntilText({super.key});

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
            state.isTimerRunning
              ? strings.main_until_timeout
              : strings.main_time_is_up,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
