/// Centralized asset paths for the MedReturn application.
///
/// Organized cleanly by resource category.
/// Place all Figma-exported asset files in their corresponding directories
/// under `assets/`.
class AppAssets {
  AppAssets._();

  // ---------------------------------------------------------------------------
  // Base Directories
  // ---------------------------------------------------------------------------
  static const String _imagesBase = 'assets/images';
  static const String _iconsBase = 'assets/icons';
  static const String _animationsBase = 'assets/animations';

  // ---------------------------------------------------------------------------
  // Logos (`assets/images/logo/`)
  // ---------------------------------------------------------------------------
  static const String logo = '$_imagesBase/logo/app_logo.png';
  static const String logoWhite = '$_imagesBase/logo/app_logo_white.png';
  static const String logoIcon = '$_imagesBase/logo/app_logo_icon.png';
  static const String splashLogo = '$_imagesBase/logo/splash_logo.png';

  // ---------------------------------------------------------------------------
  // Onboarding Illustrations (`assets/images/onboarding/`)
  // ---------------------------------------------------------------------------
  static const String onboarding1 = '$_imagesBase/onboarding/onboarding_1.png';
  static const String onboarding2 = '$_imagesBase/onboarding/onboarding_2.png';
  static const String onboarding3 = '$_imagesBase/onboarding/onboarding_3.png';

  // ---------------------------------------------------------------------------
  // Illustrations & State Graphics (`assets/images/illustrations/`)
  // ---------------------------------------------------------------------------
  static const String emptyMedicine =
      '$_imagesBase/illustrations/empty_medicine.png';
  static const String emptyRequests =
      '$_imagesBase/illustrations/empty_requests.png';
  static const String donationSuccess =
      '$_imagesBase/illustrations/donation_success.png';
  static const String verificationPending =
      '$_imagesBase/illustrations/verification_pending.png';
  static const String errorState = '$_imagesBase/illustrations/error_state.png';

  // ---------------------------------------------------------------------------
  // Promotional & Informational Banners (`assets/images/banners/`)
  // ---------------------------------------------------------------------------
  static const String homeBanner = '$_imagesBase/banners/home_banner.png';
  static const String donationDriveBanner =
      '$_imagesBase/banners/donation_drive_banner.png';

  // ---------------------------------------------------------------------------
  // Navigation Icons (`assets/icons/navigation/`)
  // ---------------------------------------------------------------------------
  static const String navHome = '$_iconsBase/navigation/ic_home.png';
  static const String navDonate = '$_iconsBase/navigation/ic_donate.png';
  static const String navInventory = '$_iconsBase/navigation/ic_inventory.png';
  static const String navRequests = '$_iconsBase/navigation/ic_requests.png';
  static const String navProfile = '$_iconsBase/navigation/ic_profile.png';

  // ---------------------------------------------------------------------------
  // Medicine Category Icons (`assets/icons/medicine/`)
  // ---------------------------------------------------------------------------
  static const String medTablet = '$_iconsBase/medicine/ic_tablet.png';
  static const String medCapsule = '$_iconsBase/medicine/ic_capsule.png';
  static const String medSyrup = '$_iconsBase/medicine/ic_syrup.png';
  static const String medInjection = '$_iconsBase/medicine/ic_injection.png';
  static const String medOintment = '$_iconsBase/medicine/ic_ointment.png';
  static const String medDrops = '$_iconsBase/medicine/ic_drops.png';
  static const String medExpired = '$_iconsBase/medicine/ic_expired.png';

  // ---------------------------------------------------------------------------
  // General Action Icons (`assets/icons/general/`)
  // ---------------------------------------------------------------------------
  static const String icSearch = '$_iconsBase/general/ic_search.png';
  static const String icFilter = '$_iconsBase/general/ic_filter.png';
  static const String icBell = '$_iconsBase/general/ic_bell.png';
  static const String icCalendar = '$_iconsBase/general/ic_calendar.png';
  static const String icCamera = '$_iconsBase/general/ic_camera.png';
  static const String icUpload = '$_iconsBase/general/ic_upload.png';
  static const String icCheckCircle = '$_iconsBase/general/ic_check_circle.png';
  static const String icAlertCircle = '$_iconsBase/general/ic_alert_circle.png';
  static const String icLocation = '$_iconsBase/general/ic_location.png';

  // ---------------------------------------------------------------------------
  // Animations (`assets/animations/`)
  // ---------------------------------------------------------------------------
  static const String animLoading = '$_animationsBase/loading.json';
  static const String animSuccessCheck = '$_animationsBase/success_check.json';
}
