import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/core/utils/functions/do_nothing.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_bloc.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_event.dart';
import 'package:hh_refresh/feature/main/presentation/widget/main_content.dart';

final class MainScreen extends StatefulWidget {
  final MainBloc bloc;
  const MainScreen({super.key, required this.bloc});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed: widget.bloc.add(OnResume());
      case AppLifecycleState.paused: widget.bloc.add(OnPause());
      case AppLifecycleState.detached: doNothing;
      case AppLifecycleState.inactive: doNothing;
      case AppLifecycleState.hidden: doNothing;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return BlocProvider(
      create: (_) => widget.bloc,
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.colors.background,
        body: SizedBox.expand(
          child: Align(
            alignment: Alignment.center,
            child: MainContent(onEvent: widget.bloc.add),
          ),
        ),
      ),
    );
  }
}
