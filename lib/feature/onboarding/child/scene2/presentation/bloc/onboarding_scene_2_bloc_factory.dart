import 'package:hh_refresh/feature/onboarding/child/scene2/domain/request_notification_persmission_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_bloc.dart';

final class OnboardingScene2BlocFactory {
  final RequestNotificationPermissionUseCase _requestNotificationPermissionUseCase;

  OnboardingScene2BlocFactory({
    required RequestNotificationPermissionUseCase requestNotificationPermissionUseCase,
  }) : _requestNotificationPermissionUseCase = requestNotificationPermissionUseCase;

  OnboardingScene2Bloc create({required void Function() onResult}) =>
    OnboardingScene2Bloc(
      onResult: onResult,
      requestNotificationPermissionUseCase: _requestNotificationPermissionUseCase,
    );
}
