/// AppStrings class contains all static string constants used throughout the app.
class AppStrings {
  AppStrings._();

  // App Name
  static const String appName = 'Genie';
  static const String appTagline = 'AI-Based Smart Ride Booking Assistant';

  // Splash
  static const String splashLoading = 'Loading your assistant...';

  // Authentication - General
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String fullName = 'Full Name';
  static const String phoneNumber = 'Phone Number';

  // Authentication - Login
  static const String loginTitle = 'Welcome Back';
  static const String loginSubtitle = 'Sign in to book your next smart ride';
  static const String rememberMe = 'Remember Me';
  static const String forgotPassword = 'Forgot Password?';
  static const String loginButton = 'Sign In';
  static const String continueWithGoogle = 'Continue with Google';
  static const String dontHaveAccount = "Don't have an account? ";
  static const String registerNow = 'Sign Up';
  static const String orDivider = 'OR';

  // Authentication - Signup
  static const String signupTitle = 'Create Account';
  static const String signupSubtitle = 'Sign up to automate your ride booking';
  static const String createAccountButton = 'Create Account';
  static const String alreadyHaveAccount = 'Already have an account? ';
  static const String signInNow = 'Sign In';

  // Authentication - Forgot Password
  static const String forgotPasswordTitle = 'Reset Password';
  static const String forgotPasswordSubtitle = 'Enter your email to receive a password reset link';
  static const String sendResetLinkButton = 'Send Reset Link';
  static const String backToLogin = 'Back to Login';

  // Validation Messages
  static const String fieldRequired = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String invalidPassword = 'Password must be at least 8 characters long';
  static const String invalidPhone = 'Please enter a valid phone number';
  static const String passwordsDoNotMatch = 'Passwords do not match';

  // General App Actions
  static const String loading = 'Loading...';
  static const String success = 'Success';
  static const String error = 'Error';
  static const String cancel = 'Cancel';
  static const String ok = 'OK';
}
