import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_refresh/core/domain/permission/request_notification_persmission_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_event.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_state.dart';
import 'package:permission_handler/permission_handler.dart';

final class OnboardingScene2Bloc extends Bloc<OnboardingScene2Event, OnboardingScene2State> {
  OnboardingScene2Bloc({
    required RequestNotificationPermissionUseCase requestNotificationPermissionUseCase,
    required void Function() onResult,
  }) : super(OnboardingScene2State()) {
    on<ContinueClick>((_, emit) => requestNotificationPermissionUseCase.execute(
      onDenied: () => emit(state.copyWith(isNotificationsDeniedShown: true)),
      onReady: () => onResult(),
    ));

    on<ShowAppSettings>((_, emit) {
      emit(state.copyWith(isNotificationsDeniedShown: false));
      openAppSettings();
    });

    on<Done>((_, emit) {
      emit(state.copyWith(isNotificationsDeniedShown: false));
      onResult();
    });
  }
}