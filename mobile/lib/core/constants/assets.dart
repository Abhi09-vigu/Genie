/// Assets class contains paths to all local assets like images, icons, and animations.
class Assets {
  Assets._();

  // Paths
  static const String _imagesPath = 'assets/images';
  static const String _iconsPath = 'assets/icons';

  // Images
  static const String appLogo = '$_imagesPath/app_logo.png';
  static const String googleLogo = '$_imagesPath/google_logo.png';

  // Icons
  static const String markerPickup = '$_iconsPath/marker_pickup.png';
  static const String markerDestination = '$_iconsPath/marker_destination.png';
  static const String micIcon = '$_iconsPath/ic_mic.png';
  static const String historyIcon = '$_iconsPath/ic_history.png';
}
