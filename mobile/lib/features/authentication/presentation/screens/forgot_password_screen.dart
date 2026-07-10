import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_text_field.dart';

/// ForgotPasswordScreen displays form to input email and reset credentials.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _disposeTimersAndControllers();
    super.dispose();
  }

  void _disposeTimersAndControllers() {
    // Left empty for standard code cleanup structure
  }

  void _onResetPressed() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<AuthProvider>().sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      if (success && mounted) {
        Navigator.pop(context); // Go back to login screen
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colors.onBackground),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceXXL),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AuthLogo(size: 70.0, showText: true),
                  AppDimensions.verticalSpace3XL,

                  Text(
                    AppStrings.forgotPasswordTitle,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                  AppDimensions.verticalSpaceS,
                  Text(
                    AppStrings.forgotPasswordSubtitle,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  AppDimensions.verticalSpace3XL,

                  // Email
                  AuthTextField(
                    controller: _emailController,
                    labelText: AppStrings.email,
                    hintText: 'Enter your email address',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    enabled: !authProvider.isLoading,
                    textInputAction: TextInputAction.done,
                  ),
                  AppDimensions.verticalSpaceXXL,

                  // Send Reset Link Button
                  AuthButton(
                    text: AppStrings.sendResetLinkButton,
                    onPressed: _onResetPressed,
                    isLoading: authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpace3XL,

                  // Back to Login text action
                  TextButton(
                    onPressed: authProvider.isLoading ? null : () => Navigator.pop(context),
                    child: Text(
                      AppStrings.backToLogin,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AppDimensions.verticalSpaceXXL,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
