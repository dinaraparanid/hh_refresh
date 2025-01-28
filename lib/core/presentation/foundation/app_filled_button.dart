import 'package:flutter/material.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

final class AppFilledButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: theme.colors.button.content,
        backgroundColor: theme.colors.button.background,
        padding: EdgeInsets.symmetric(
          vertical: theme.dimensions.padding.medium,
          horizontal: theme.dimensions.padding.extraMedium,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.small),
          )
        )
      ),
      child: child,
    );
  }
}
