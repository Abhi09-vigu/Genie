import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../utils/extensions.dart';

/// LoadingWidget is a polished circular loading indicator.
class LoadingWidget extends StatelessWidget {
  final String? message;
  final bool isOverlay;

  const LoadingWidget({
    super.key,
    this.message,
    this.isOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final indicator = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          strokeWidth: 3.5,
        ),
        if (message != null) ...[
          AppDimensions.verticalSpaceM,
          Text(
            message!,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colors.onSurface,
            ),
          ),
        ],
      ],
    );

    if (!isOverlay) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXXL),
          child: indicator,
        ),
      );
    }

    return Stack(
      children: [
        // Semi-transparent backdrop
        const ModalBarrier(
          dismissible: false,
          color: Colors.black38,
        ),
        Center(
          child: Card(
            elevation: AppDimensions.cardElevationHover,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            ),
            color: context.colors.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceXXL,
                vertical: AppDimensions.spaceXL,
              ),
              child: indicator,
            ),
          ),
        ),
      ],
    );
  }
}
