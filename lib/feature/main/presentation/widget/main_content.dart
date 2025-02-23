import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/permission/notifications_denied_dialog.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/core/utils/extensions/bool_ext.dart';
import 'package:hh_refresh/core/utils/functions/distinct_state.dart';
import 'package:hh_refresh/core/utils/functions/produce_if.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/main/presentation/widget/clock/clock.dart';
import 'package:hh_refresh/feature/main/presentation/widget/failed_to_open_browser_dialog.dart';
import 'package:hh_refresh/feature/main/presentation/widget/main_button.dart';

final class MainContent extends StatelessWidget {
  final void Function(MainEvent) onEvent;
  const MainContent({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) => BlocConsumer<MainBloc, MainState>(
    listenWhen: distinctState((state) => (
      state.isFailedToOpenBrowserDialogShown,
      state.isNotificationDeniedShown,
    )),
    listener: (context, state) => _stateListener(context: context, state: state),
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
                text: state.isTimerNeverLaunched
                  ? strings.main_start_timer
                  : strings.main_restart_timer,
                onPressed: () => onEvent(RestartClick()),
              ),
            ),
          ].whereType<Widget>().toList(growable: false),
        ),
      );
    }
  );

  void _stateListener({
    required BuildContext context,
    required MainState state,
  }) async => switch ((
    state.isFailedToOpenBrowserDialogShown,
    state.isNotificationDeniedShown,
  )) {
    (true, _) => showFailedToOpenBrowserDialog(context: context),

    (_, true) => switch (await showNotificationsDeniedDialog(context: context)) {
      NotificationDialogResult.grant => onEvent(ShowAppSettings()),
      _ => onEvent(ChangeNotificationDeniedDialogVisibility(isVisible: false)),
    },

    (_, _) => _closeDialogs(),
  };

  void _closeDialogs() {
    onEvent(ChangeFailedToOpenBrowserDialogVisibility(isVisible: false));
    onEvent(ChangeNotificationDeniedDialogVisibility(isVisible: false));
  }
}