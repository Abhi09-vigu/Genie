import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_strings.dart';
import '../core/widgets/loading_widget.dart';
import '../features/authentication/presentation/providers/auth_provider.dart';
import '../routes/app_router.dart';
import '../shared/providers/app_provider.dart';
import '../theme/app_theme.dart';

/// GenieApp represents the root widget configuration of the mobile application.
class GenieApp extends StatelessWidget {
  const GenieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, appProvider, child) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            // Theme Setup
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appProvider.themeMode,
            // Navigation Keys
            navigatorKey: AppRouter.navigatorKey,
            scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
            // Routing
            initialRoute: AppRouter.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
            // Global Overlay widgets
            builder: (context, child) {
              return Stack(
                children: [
                  if (child != null) child,
                  // Overlay Global Loader
                  if (appProvider.isGlobalLoading)
                    LoadingWidget(
                      message: appProvider.loadingMessage,
                      isOverlay: true,
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
