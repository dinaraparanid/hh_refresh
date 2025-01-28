import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/foundation/app_filled_button.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/widget/clock_icon.dart';

final class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;
    final bloc = context.read<OnboardingBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClockIcon(),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        Text(
          strings.onboarding_title,
          textAlign: TextAlign.center,
          style: theme.typography.h.h2.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colors.text,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        Text(
          strings.onboarding_description,
          textAlign: TextAlign.center,
          style: theme.typography.body.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colors.text,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.extraMedium),

        AppFilledButton(
          onPressed: () => bloc.add(BeginButtonClick()),
          child: Text(
            strings.begin,
            style: theme.typography.h.h3.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colors.text,
            ),
          ),
        ),
      ],
    );
  }
}
