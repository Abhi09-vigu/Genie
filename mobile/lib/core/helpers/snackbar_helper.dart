import 'package:flutter/material.dart';
import '../../routes/app_router.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

/// SnackbarHelper provides utility methods to show global toast-like notifications.
class SnackbarHelper {
  SnackbarHelper._();

  /// Shows a custom snackbar using the global ScaffoldMessenger key.
  static void show({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final state = AppRouter.scaffoldMessengerKey.currentState;
    if (state == null) return;

    state.hideCurrentSnackBar();
    state.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: AppDimensions.iconS),
              AppDimensions.horizontalSpaceS,
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
        duration: duration,
        margin: const EdgeInsets.all(AppDimensions.spaceL),
      ),
    );
  }

  /// Shows a success snackbar.
  static void showSuccess(String message) {
    show(
      message: message,
      backgroundColor: AppColors.success,
      textColor: Colors.white,
      icon: Icons.check_circle_outline,
    );
  }

  /// Shows an error snackbar.
  static void showError(String message) {
    show(
      message: message,
      backgroundColor: AppColors.lightError,
      textColor: Colors.white,
      icon: Icons.error_outline,
    );
  }

  /// Shows an info snackbar.
  static void showInfo(String message) {
    show(
      message: message,
      backgroundColor: AppColors.info,
      textColor: Colors.white,
      icon: Icons.info_outline,
    );
  }

  /// Shows a warning snackbar.
  static void showWarning(String message) {
    show(
      message: message,
      backgroundColor: AppColors.warning,
      textColor: Colors.black,
      icon: Icons.warning_amber_outlined,
    );
  }
}
