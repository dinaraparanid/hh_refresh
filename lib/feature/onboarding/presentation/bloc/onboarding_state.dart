import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hh_refresh/feature/onboarding/presentation/bloc/onboarding_child.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingChild.scene1()) OnboardingChild child,
  }) = _OnboardingState;
}
