import 'package:flutter/material.dart';

/// AppDimensions class contains layout metrics like padding, spacing, and border radius.
class AppDimensions {
  AppDimensions._();

  // Spacing (Margins and Paddings)
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 20.0;
  static const double spaceXXL = 24.0;
  static const double space3XL = 32.0;
  static const double space4XL = 48.0;

  // Custom Sized Boxes for vertical space
  static const SizedBox verticalSpaceXS = SizedBox(height: spaceXS);
  static const SizedBox verticalSpaceS = SizedBox(height: spaceS);
  static const SizedBox verticalSpaceM = SizedBox(height: spaceM);
  static const SizedBox verticalSpaceL = SizedBox(height: spaceL);
  static const SizedBox verticalSpaceXL = SizedBox(height: spaceXL);
  static const SizedBox verticalSpaceXXL = SizedBox(height: spaceXXL);
  static const SizedBox verticalSpace3XL = SizedBox(height: space3XL);

  // Custom Sized Boxes for horizontal space
  static const SizedBox horizontalSpaceXS = SizedBox(width: spaceXS);
  static const SizedBox horizontalSpaceS = SizedBox(width: spaceS);
  static const SizedBox horizontalSpaceM = SizedBox(width: spaceM);
  static const SizedBox horizontalSpaceL = SizedBox(width: spaceL);
  static const SizedBox horizontalSpaceXL = SizedBox(width: spaceXL);
  static const SizedBox horizontalSpaceXXL = SizedBox(width: spaceXXL);

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0; // Standard radius as per requirements
  static const double radiusXL = 24.0;
  static const double radiusXXL = 32.0;
  static const double radiusCircular = 999.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;

  // Button Heights
  static const double buttonHeight = 56.0;
  static const double buttonHeightMin = 48.0;

  // App Bar Height
  static const double appBarHeight = 56.0;

  // Card & Container Sizing
  static const double cardElevation = 2.0;
  static const double cardElevationHover = 6.0;
}
