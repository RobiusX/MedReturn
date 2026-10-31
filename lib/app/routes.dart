import 'package:flutter/material.dart';

import '../core/widgets/unknown_route_screen.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/register_screen.dart';
import '../features/authentication/screens/role_selection_screen.dart';
import '../features/dashboard/screens/clinic_dashboard_screen.dart';
import '../features/dashboard/screens/donor_dashboard_screen.dart';
import '../features/dashboard/screens/pharmacist_dashboard_screen.dart';
import '../features/dashboard/screens/profile_screen.dart';
import '../features/donation/screens/donate_medicine_screen.dart';

/// Centralized route definitions and route generator for the MedReturn application.
class AppRoutes {
  AppRoutes._();

  // Route paths
  static const String login = '/';
  static const String roleSelection = '/role-selection';
  static const String donorDashboard = '/donor-dashboard';
  static const String clinicDashboard = '/clinic-dashboard';
  static const String pharmacistDashboard = '/pharmacist-dashboard';
  static const String register = '/register';
  static const String donate = '/donate';
  static const String profile = '/profile';

  /// Standard route builder map.
  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    roleSelection: (context) => const RoleSelectionScreen(),
    donorDashboard: (context) => const DonorDashboardScreen(),
    clinicDashboard: (context) => const ClinicDashboardScreen(),
    pharmacistDashboard: (context) => const PharmacistDashboardScreen(),
    register: (context) => const RegisterScreen(),
    donate: (context) => const DonateMedicineScreen(),
    profile: (context) => const ProfileScreen(),
  };

  /// Dynamic route generator supporting arguments and custom transitions.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(settings: settings, builder: builder);
    }
    // If the route name is not in the map, delegate to onUnknownRoute
    return onUnknownRoute(settings);
  }

  /// Handles any invalid or unregistered routes safely with a 404 screen.
  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => UnknownRouteScreen(routeName: settings.name),
    );
  }
}
