import 'package:flutter/material.dart';

/// AppColors class defines the application's color palette.
/// It contains static color constants used for both Light and Dark themes.
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Primary Palette
  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF38BDF8);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightOnBackground = Color(0xFF0F172A);
  static const Color lightOnSurface = Color(0xFF0F172A);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightError = Color(0xFFEF4444);
  static const Color lightOnError = Color(0xFFFFFFFF);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkOnSecondary = Color(0xFF0F172A);
  static const Color darkOnBackground = Color(0xFFF8FAFC);
  static const Color darkOnSurface = Color(0xFFF8FAFC);
  static const Color darkBorder = Color(0xFF334155);
  static const Color darkError = Color(0xFFF87171);
  static const Color darkOnError = Color(0xFF0F172A);

  // Common UI Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  static const Color grey = Color(0xFF64748B);
  static const Color lightGrey = Color(0xFF94A3B8);
}
