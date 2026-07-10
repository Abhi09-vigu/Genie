import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/extensions.dart';

/// AuthLogo displays the stylized Genie app icon and name.
class AuthLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AuthLogo({
    super.key,
    this.size = 80.0,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Premium Vector-style Logo Container
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(size * 0.28), // Sleek rounded square
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 16.0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.auto_awesome, // Represents 'Genie' magic ride automation
            color: Colors.white,
            size: size * 0.5,
          ),
        ),
        if (showText) ...[
          AppDimensions.verticalSpaceM,
          Text(
            AppStrings.appName,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: context.colors.onBackground,
            ),
          ),
          AppDimensions.verticalSpaceXS,
          Text(
            AppStrings.appTagline,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.onBackground.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
