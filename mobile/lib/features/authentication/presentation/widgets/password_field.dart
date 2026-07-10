import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/extensions.dart';

/// PasswordField displays an input field for passwords with eye toggle.
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool enabled;

  const PasswordField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.onBackground.withOpacity(0.8),
          ),
        ),
        AppDimensions.verticalSpaceS,
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          enabled: widget.enabled,
          style: TextStyle(
            color: context.colors.onBackground,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: context.colors.onBackground.withOpacity(0.5),
              size: AppDimensions.iconM,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: context.colors.onBackground.withOpacity(0.5),
                size: AppDimensions.iconM,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
