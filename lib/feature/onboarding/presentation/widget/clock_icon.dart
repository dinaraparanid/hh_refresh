import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

final class ClockIcon extends StatelessWidget {
  const ClockIcon({super.key});

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
            AppImages.loadSvg('ic_duration').value,
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