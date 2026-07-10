import 'package:flutter/material.dart';
import '../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/signup_screen.dart';
import '../features/authentication/presentation/screens/splash_screen.dart';

/// AppRouter defines all named routes and route generation logic for the app.
class AppRouter {
  AppRouter._();

  // Global Keys for contextless navigation and alerts
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Route Names
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  /// Generates the routes with smooth slide/fade animations.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildAnimatedRoute(const SplashScreen(), settings);
      case login:
        return _buildAnimatedRoute(const LoginScreen(), settings);
      case signup:
        return _buildAnimatedRoute(const SignupScreen(), settings);
      case forgotPassword:
        return _buildAnimatedRoute(const ForgotPasswordScreen(), settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  /// Builds a smooth custom slide-up/fade page route transition.
  static PageRouteBuilder _buildAnimatedRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.05); // Subtle slide-up
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        var fadeAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
