import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/di/app_module.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_bloc_factory.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class App extends StatelessWidget {
  final router = di<AppRouter>();
  final rootBlocFactory = di<RootBlocFactory>();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.create(
      theme: switch (MediaQuery.of(context).platformBrightness) {
        Brightness.dark => AppThemeColors.dark,
        Brightness.light => AppThemeColors.light,
      },
    );

    return AppThemeProvider(
      theme: theme,
      child: BlocProvider(
        create: (_) => rootBlocFactory.create(),
        child: MaterialApp.router(
          routerConfig: router.router,
          color: theme.colors.background,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
