import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/extensions.dart';

enum AuthButtonStyle { primary, secondary }

/// AuthButton is a reusable button that supports loading states and styles.
class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AuthButtonStyle style;
  final Widget? icon;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.style = AuthButtonStyle.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonContent = isLoading
        ? SizedBox(
            height: 24.0,
            width: 24.0,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                style == AuthButtonStyle.primary ? Colors.white : context.colors.primary,
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                AppDimensions.horizontalSpaceS,
              ],
              Text(text),
            ],
          );

    if (style == AuthButtonStyle.secondary) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        child: buttonContent,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: buttonContent,
    );
  }
}
