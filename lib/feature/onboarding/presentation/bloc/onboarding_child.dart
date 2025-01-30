import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_child.freezed.dart';

@freezed
sealed class OnboardingChild with _$OnboardingChild {
  const factory OnboardingChild.scene1() = Scene1;
  const factory OnboardingChild.scene2() = Scene2;
}
