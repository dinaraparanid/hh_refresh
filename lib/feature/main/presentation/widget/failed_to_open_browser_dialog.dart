import 'package:flutter/material.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

Future<void> showFailedToOpenBrowserDialog({
  required BuildContext context,
}) async {
  final theme = context.appTheme;
  final strings = context.strings;

  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: theme.colors.background,
      title: Text(
        strings.main_failed_to_open_browser,
        style: theme.typography.h.h2.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colors.text,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            strings.ok,
            selectionColor: theme.colors.button.background,
            style: theme.typography.regular.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colors.text,
            ),
          ),
        ),
      ],
    ),
  );
}
