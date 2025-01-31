import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/utils/functions/distinct_state.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/widget/notifications_denied_dialog.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/widget/onboarding_scene_2_content.dart';

final class OnboardingScene2 extends StatelessWidget {
  final OnboardingScene2Bloc bloc;
  const OnboardingScene2({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => bloc,
    child: BlocListener<OnboardingScene2Bloc, OnboardingScene2State>(
      listenWhen: distinctState((s) => s.isNotificationsDeniedShown),
      listener: (context, state) async {
        if (state.isNotificationsDeniedShown) {
          switch (await showNotificationsDeniedDialog(context: context)) {
            case NotificationDialogResult.grant: bloc.add(ShowAppSettings());
            case _: bloc.add(Done());
          }
        }
      },
      child: OnboardingScene2Content(onEvent: bloc.add),
    ),
  );
}
