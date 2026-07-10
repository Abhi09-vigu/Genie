import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_strings.dart';
import '../utils/extensions.dart';

/// DialogHelper provides utility methods to show global dialogs.
class DialogHelper {
  DialogHelper._();

  /// Gets the current navigation context.
  static BuildContext? get _context => AppRouter.navigatorKey.currentContext;

  /// Shows a standard information dialog.
  static Future<void> showInfoDialog({
    required String title,
    required String message,
    String confirmText = AppStrings.ok,
    VoidCallback? onConfirm,
  }) async {
    final context = _context;
    if (context == null) return;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          ),
          title: Text(
            title,
            style: ctx.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: ctx.textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                if (onConfirm != null) onConfirm();
              },
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }

  /// Shows an error dialog.
  static Future<void> showErrorDialog({
    required String message,
    VoidCallback? onConfirm,
  }) async {
    return showInfoDialog(
      title: AppStrings.error,
      message: message,
      confirmText: AppStrings.ok,
      onConfirm: onConfirm,
    );
  }

  /// Shows a confirmation dialog with custom actions.
  static Future<bool> showConfirmDialog({
    required String title,
    required String message,
    String confirmText = AppStrings.ok,
    String cancelText = AppStrings.cancel,
  }) async {
    final context = _context;
    if (context == null) return false;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          ),
          title: Text(
            title,
            style: ctx.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: ctx.textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
