import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/mod.dart';

final class OnboardingScreen extends StatelessWidget {
  final OnboardingBloc bloc;
  const OnboardingScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
      ),
    );
  }
}