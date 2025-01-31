import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hh_refresh/core/presentation/foundation/app_filled_button.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';
import 'package:hh_refresh/feature/onboarding/child/scene2/presentation/bloc/mod.dart';
import 'package:hh_refresh/feature/onboarding/presentation/widget/onboarding_icon.dart';

final class OnboardingScene2Content extends StatelessWidget {
  final void Function(OnboardingScene2Event) onEvent;
  const OnboardingScene2Content({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Scaffold(
      extendBody: true,
      backgroundColor: theme.colors.background,
      body: SizedBox.expand(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OnboardingIcon(svgIconName: 'ic_cv'),

              SizedBox(height: theme.dimensions.padding.extraMedium),

              Text(
                strings.onboarding_scene_2_title,
                textAlign: TextAlign.center,
                style: theme.typography.h.h2.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colors.text,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraMedium),

              Text(
                strings.onboarding_scene_2_description,
                textAlign: TextAlign.center,
                style: theme.typography.body.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colors.text,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.extraMedium),

              AppFilledButton(
                onPressed: () => onEvent(ContinueClick()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.loadSvg('ic_duration').value,
                      width: theme.dimensions.size.small,
                      height: theme.dimensions.size.small,
                      colorFilter: ColorFilter.mode(
                        theme.colors.button.content,
                        BlendMode.srcIn,
                      ),
                    ),

                    SizedBox(width: theme.dimensions.padding.small),

                    Text(
                      strings.continue_,
                      style: theme.typography.h.h3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colors.button.content,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
