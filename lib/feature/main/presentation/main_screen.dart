import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';
import 'package:hh_refresh/feature/main/presentation/widget/main_content.dart';

final class MainScreen extends StatelessWidget {
  final MainBloc bloc;
  const MainScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
        body: SizedBox.expand(
          child: Align(
            alignment: Alignment.center,
            child: MainContent(onEvent: bloc.add),
          ),
        ),
      ),
    );
  }
}