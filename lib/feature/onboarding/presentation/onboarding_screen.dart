import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:hh_refresh/feature/onboarding/presentation/widget/onboarding_body.dart';

final class OnboardingScreen extends StatelessWidget {
  final OnboardingBloc bloc;
  const OnboardingScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<OnboardingBloc, void>(
        builder: (context, _) => Scaffold(
          extendBody: true,
          backgroundColor: theme.colors.background,
          body: SizedBox.expand(
            child: Align(
              alignment: Alignment.center,
              child: OnboardingBody(),
            ),
          ),
        ),
      ),
    );
  }
}