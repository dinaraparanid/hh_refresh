import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

final class OnboardingIcon extends StatelessWidget {
  final String svgIconName;
  const OnboardingIcon({super.key, required this.svgIconName});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.primary,
        shape: BoxShape.circle,
      ),
      width: theme.dimensions.size.big,
      height: theme.dimensions.size.big,
      child: Align(
        alignment: Alignment.center,
        child: Wrap(children: [
          SvgPicture.asset(
            AppImages.loadSvg(svgIconName).value,
            width: theme.dimensions.size.medium,
            height: theme.dimensions.size.medium,
            colorFilter: ColorFilter.mode(
              theme.colors.icon.primary,
              BlendMode.srcIn,
            ),
          ),
        ]),
      ),
    );
  }
}
