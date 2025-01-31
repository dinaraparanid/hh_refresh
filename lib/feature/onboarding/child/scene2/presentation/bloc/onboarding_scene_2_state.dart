import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_scene_2_state.freezed.dart';

@freezed
abstract class OnboardingScene2State with _$OnboardingScene2State {
  const factory OnboardingScene2State({
    @Default(false) bool isNotificationsDeniedShown
  }) = _OnboardingScene2State;
}
