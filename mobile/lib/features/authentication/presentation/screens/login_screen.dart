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

/// LoginScreen displays form inputs to sign in.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthProvider>().signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
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
                  AppDimensions.verticalSpace3XL,
                  const AuthLogo(size: 70.0, showText: true),
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
                  AppDimensions.verticalSpaceS,

                  // Remember me & Forgot Password Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: authProvider.rememberMe,
                            onChanged: authProvider.isLoading
                                ? null
                                : authProvider.toggleRememberMe,
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          Text(
                            AppStrings.rememberMe,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: authProvider.isLoading
                            ? null
                            : () => Navigator.pushNamed(context, AppRouter.forgotPassword),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Login Button
                  AuthButton(
                    text: AppStrings.loginButton,
                    onPressed: _onLoginPressed,
                    isLoading: authProvider.isLoading,
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider(color: context.colors.outline.withOpacity(0.5))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceM),
                        child: Text(
                          AppStrings.orDivider,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onBackground.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: context.colors.outline.withOpacity(0.5))),
                    ],
                  ),
                  AppDimensions.verticalSpaceXL,

                  // Continue with Google (Disabled UI-only)
                  AuthButton(
                    text: AppStrings.continueWithGoogle,
                    onPressed: null, // Disabled UI only
                    style: AuthButtonStyle.secondary,
                    icon: Icon(
                      Icons.g_mobiledata,
                      size: AppDimensions.iconL,
                      color: context.colors.onBackground.withOpacity(0.3),
                    ),
                  ),
                  AppDimensions.verticalSpace3XL,

                  // Bottom Sign Up Switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAccount,
                        style: context.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: authProvider.isLoading
                            ? null
                            : () => Navigator.pushReplacementNamed(context, AppRouter.signup),
                        child: Text(
                          AppStrings.registerNow,
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
