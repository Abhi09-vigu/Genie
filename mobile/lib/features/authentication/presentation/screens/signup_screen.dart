import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../../routes/app_router.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/password_field.dart';

/// SignupScreen displays input fields to register a user profile.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignupPressed() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<AuthProvider>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
      );
      if (success && mounted) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
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
                  AppDimensions.verticalSpaceXXL,
                  const AuthLogo(size: 60.0, showText: true),
                  AppDimensions.verticalSpaceXXL,

                  // Full Name
                  AuthTextField(
                    controller: _nameController,
                    labelText: AppStrings.fullName,
                    hintText: 'Enter your full name',
                    prefixIcon: Icons.person_outline,
                    validator: Validators.validateRequired,
                    enabled: !authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Phone Number
                  AuthTextField(
                    controller: _phoneController,
                    labelText: AppStrings.phoneNumber,
                    hintText: 'Enter your phone number',
                    prefixIcon: Icons.phone_android_outlined,
                    keyboardType: TextInputType.phone,
                    validator: Validators.validatePhone,
                    enabled: !authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Email
                  AuthTextField(
                    controller: _emailController,
                    labelText: AppStrings.email,
                    hintText: 'Enter your email address',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    enabled: !authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Password
                  PasswordField(
                    controller: _passwordController,
                    labelText: AppStrings.password,
                    hintText: 'Enter your password',
                    validator: Validators.validatePassword,
                    enabled: !authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Confirm Password
                  PasswordField(
                    controller: _confirmPasswordController,
                    labelText: AppStrings.confirmPassword,
                    hintText: 'Re-enter your password',
                    validator: (val) => Validators.validateConfirmPassword(
                      val,
                      _passwordController.text,
                    ),
                    enabled: !authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXXL,

                  // Create Account Button
                  AuthButton(
                    text: AppStrings.createAccountButton,
                    onPressed: _onSignupPressed,
                    isLoading: authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXXL,

                  // Bottom Sign In switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyHaveAccount,
                        style: context.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: authProvider.isLoading
                            ? null
                            : () => Navigator.pushReplacementNamed(context, AppRouter.login),
                        child: Text(
                          AppStrings.signInNow,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
