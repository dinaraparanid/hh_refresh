import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_event.dart';
import 'package:hh_refresh/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<WebClick>((event, emit) {
      
    });

    on<StopClick>((event, emit) {

    });

    on<RestartClick>((event, emit) {

    });
  }
}
