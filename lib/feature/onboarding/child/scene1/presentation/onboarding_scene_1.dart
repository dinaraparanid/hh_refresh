import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/foundation/app_filled_button.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/onboarding/child/scene1/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/widget/onboarding_icon.dart';

final class OnboardingScene1 extends StatelessWidget {
  final OnboardingScene1Bloc bloc;
  const OnboardingScene1({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
        body: SizedBox.expand(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OnboardingIcon(svgIconName: 'ic_clock'),

                SizedBox(height: theme.dimensions.padding.extraMedium),

                Text(
                  strings.onboarding_scene_1_title,
                  textAlign: TextAlign.center,
                  style: theme.typography.h.h2.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colors.text,
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.extraMedium),

                Text(
                  strings.onboarding_scene_1_description,
                  textAlign: TextAlign.center,
                  style: theme.typography.body.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colors.text,
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.extraMedium),

                AppFilledButton(
                  onPressed: () => bloc.add(BeginClick()),
                  child: Text(
                    strings.begin,
                    style: theme.typography.h.h3.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colors.button.content,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
