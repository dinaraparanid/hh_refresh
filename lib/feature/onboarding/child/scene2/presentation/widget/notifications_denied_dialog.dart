import 'package:flutter/material.dart';
import 'package:hh_refresh/core/presentation/theme/mod.dart';
import 'package:hh_refresh/core/presentation/theme/theme_provider.dart';

enum NotificationDialogResult { ignore, grant }

Future<NotificationDialogResult?> showNotificationsDeniedDialog({
  required BuildContext context,
}) async {
  final theme = context.appTheme;
  final strings = context.strings;

  return showAdaptiveDialog<NotificationDialogResult>(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: theme.colors.background,
      title: Text(
        strings.notifications_denied_dialog_title,
        style: theme.typography.h.h2.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colors.text,
        ),
      ),
      content: Text(
        strings.notifications_denied_dialog_description,
        style: theme.typography.regular.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colors.text,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator
            .of(context)
            .pop(NotificationDialogResult.ignore),
          child: Text(
            strings.deny,
            selectionColor: theme.colors.button.background,
            style: theme.typography.regular.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colors.text,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator
            .of(context)
            .pop(NotificationDialogResult.grant),
          child: Text(
            strings.allow,
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