import 'package:get_it/get_it.dart';
import 'package:hh_refresh/core/di/provide_singleton.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/domain/request_notification_persmission_use_case.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/onboarding_scene_2_bloc_factory.dart';

extension OnboardingScene2Module on GetIt {
  List<Type> registerOnboardingScene2Module() => [
    provideSingleton<RequestNotificationPermissionUseCase>(
      () => RequestNotificationPermissionUseCase(),
    ),
    provideSingleton<OnboardingScene2BlocFactory>(
      () => OnboardingScene2BlocFactory(
        requestNotificationPermissionUseCase: this(),
      ),
    ),
  ];
}
