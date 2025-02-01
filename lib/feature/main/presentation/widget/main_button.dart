import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hh_refresh/core/presentation/foundation/app_filled_button.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

final class MainButton extends StatelessWidget {
  final String iconSvg;
  final String text;
  final void Function() onPressed;

  const MainButton({
    super.key,
    required this.iconSvg,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return AppFilledButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.loadSvg(iconSvg).value,
            width: theme.dimensions.size.small,
            height: theme.dimensions.size.small,
            colorFilter: ColorFilter.mode(
              theme.colors.button.content,
              BlendMode.srcIn,
            ),
          ),

          SizedBox(width: theme.dimensions.padding.small),

          Text(text, style: theme.typography.body.copyWith(
            color: theme.colors.button.content,
            fontWeight: FontWeight.w700,
          )),
        ],
      ),
    );
  }
}