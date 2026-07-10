import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';

/// AppTheme manages light and dark theme configurations using Material 3.
class AppTheme {
  AppTheme._();

  /// Returns light theme configuration.
  static ThemeData get lightTheme {
    return _buildTheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.lightBackground,
      surface: AppColors.lightSurface,
      onPrimary: AppColors.lightOnPrimary,
      onSecondary: AppColors.lightOnSecondary,
      onBackground: AppColors.lightOnBackground,
      onSurface: AppColors.lightOnSurface,
      border: AppColors.lightBorder,
      error: AppColors.lightError,
      onError: AppColors.lightOnError,
    );
  }

  /// Returns dark theme configuration.
  static ThemeData get darkTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.darkBackground,
      surface: AppColors.darkSurface,
      onPrimary: AppColors.darkOnPrimary,
      onSecondary: AppColors.darkOnSecondary,
      onBackground: AppColors.darkOnBackground,
      onSurface: AppColors.darkOnSurface,
      border: AppColors.darkBorder,
      error: AppColors.darkError,
      onError: AppColors.darkOnError,
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color background,
    required Color surface,
    required Color onPrimary,
    required Color onSecondary,
    required Color onBackground,
    required Color onSurface,
    required Color border,
    required Color error,
    required Color onError,
  }) {
    final baseTheme = brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        error: error,
        onError: onError,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
        outline: border,
      ),
      // Apply Google Fonts Poppins globally
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        titleLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: onSurface,
        ),
        titleMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: onSurface,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: onSurface,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: onSurface.withOpacity(0.8),
        ),
      ),
      // Card Styling
      cardTheme: CardThemeData(
        color: surface,
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        ),
      ),
      // Input Text Field Styling
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.light
            ? AppColors.lightBackground.withOpacity(0.5)
            : AppColors.darkSurface.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceXL,
          vertical: AppDimensions.spaceXL,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          borderSide: BorderSide(color: border.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          borderSide: BorderSide(color: error, width: 2),
        ),
        hintStyle: TextStyle(
          color: onSurface.withOpacity(0.4),
          fontSize: 14.0,
        ),
      ),
      // Elevate Button Styling
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      // Outlined Button Styling
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: BorderSide(color: primary),
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          ),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
