import 'package:flutter/material.dart';

import 'routes.dart';

/// Centralized navigation service for the MedReturn application.
///
/// Responsibilities:
/// - Keeps navigation logic completely separated from UI presentation.
/// - Prevents duplicate navigation calls caused by rapid double-tapping.
/// - Fully supports Android hardware and gesture back navigation.
class AppNavigator {
  AppNavigator._();

  static bool _isNavigating = false;

  /// Internal safe push helper that guards against rapid repeated taps
  /// and redundant duplicate pushes to the same active route.
  static Future<T?> _navigateSafely<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool replace = false,
  }) async {
    // If navigation was triggered in the last 400ms, ignore duplicate rapid taps.
    if (_isNavigating) return null;

    // If current route is already the target route, avoid duplicate push.
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == routeName) return null;

    _isNavigating = true;
    // Release the navigation lock after a brief debounce period
    Future.delayed(const Duration(milliseconds: 400), () {
      _isNavigating = false;
    });

    if (replace) {
      return Navigator.of(context)
          .pushReplacementNamed<T, dynamic>(routeName, arguments: arguments);
    } else {
      return Navigator.of(context)
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }

  /// Navigate to Login Screen.
  static Future<void> toLogin(BuildContext context) {
    return _navigateSafely(context, AppRoutes.login);
  }

  /// Navigate to Role Selection Screen.
  static Future<void> toRoleSelection(BuildContext context) {
    return _navigateSafely(context, AppRoutes.roleSelection);
  }

  /// Navigate to Donor Dashboard Screen.
  static Future<void> toDonorDashboard(BuildContext context) {
    return _navigateSafely(context, AppRoutes.donorDashboard);
  }

  /// Navigate to Clinic Dashboard Screen.
  static Future<void> toClinicDashboard(BuildContext context) {
    return _navigateSafely(context, AppRoutes.clinicDashboard);
  }

  /// Navigate to Pharmacist Dashboard Screen.
  static Future<void> toPharmacistDashboard(BuildContext context) {
    return _navigateSafely(context, AppRoutes.pharmacistDashboard);
  }

  /// Navigate to Registration Screen.
  static Future<void> toRegister(BuildContext context) {
    return _navigateSafely(context, AppRoutes.register);
  }

  /// Navigate to Donate Medicine Screen.
  static Future<void> toDonateMedicine(BuildContext context) {
    return _navigateSafely(context, AppRoutes.donate);
  }

  /// Navigate to User Profile Screen.
  static Future<void> toProfile(BuildContext context) {
    return _navigateSafely(context, AppRoutes.profile);
  }

  /// Generic named route navigation.
  static Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return _navigateSafely<T>(context, routeName, arguments: arguments);
  }

  /// Generic replacement named route navigation.
  static Future<T?> pushReplacementNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return _navigateSafely<T>(
      context,
      routeName,
      arguments: arguments,
      replace: true,
    );
  }

  /// Safe pop operation for back navigation (handles Android back).
  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).maybePop(result);
  }
}
