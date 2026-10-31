/// Centralized string constants for the MedReturn application.
///
/// Matches all text displayed on the MedReturn Figma designs.
class AppStrings {
  AppStrings._();

  // App branding
  static const String appName = 'MedReturn';
  static const String appTagline = 'Safe medicine. Better access.';

  // Login Screen
  static const String emailAddressLabel = 'Email Address';
  static const String emailHint = 'name@university.edu';
  static const String passwordLabel = 'Password';
  static const String passwordHint = '••••••••';
  static const String loginButton = 'Login';
  static const String newToMedReturn = 'New to MedReturn?';
  static const String register = 'Register';

  // Role Selection Screen
  static const String chooseYourRole = 'Choose your role';
  static const String roleSelectionSubtitle =
      'Select how you want to use the platform to get started.';

  static const String roleDonorTitle = 'Donor';
  static const String roleDonorDescription =
      'Donate unused, unexpired safe medications.';

  static const String roleClinicTitle = 'Clinic';
  static const String roleClinicDescription =
      'Search and request needed medicines for patients.';

  static const String rolePharmacistTitle = 'Pharmacist';
  static const String rolePharmacistDescription =
      'Verify and safety-check donated medicines.';

  // Donor Dashboard Screen
  static const String donorGreeting = 'Hello, Robius!';
  static const String donorSubtitle = 'Thank you for donating.';
  static const String totalDonatedLabel = 'Total Donated';
  static const String activeDonationsLabel = 'Active Donations';
  static const String donateMedicineButton = 'Donate Medicine';
  static const String recentDonationsSection = 'Recent Donations';
  static const String unitsSuffix = 'units';

  // Badges
  static const String statusDelivered = 'DELIVERED';
  static const String statusInTransit = 'IN TRANSIT';
  static const String statusPending = 'PENDING';
}
