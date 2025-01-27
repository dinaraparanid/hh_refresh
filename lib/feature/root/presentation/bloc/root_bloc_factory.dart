import 'package:hh_refresh/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:hh_refresh/feature/root/presentation/bloc/root_bloc.dart';
import 'package:hh_refresh/navigation/app_router.dart';

final class RootBlocFactory {
  final AppRouter _router;
  final InitialScreenUseCase _initialScreenUseCase;

  RootBlocFactory({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
  }) : _router = router,
    _initialScreenUseCase = initialScreenUseCase;

  RootBloc create() => RootBloc(
    router: _router,
    initialScreenUseCase: _initialScreenUseCase,
  );
}