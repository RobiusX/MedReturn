import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import 'routes.dart';

/// Root application widget for MedReturn.
///
/// Configured with centralized routes from `AppRoutes`, Material 3 theming,
/// and safe handling for unknown routes.
class MedReturnApp extends StatelessWidget {
  const MedReturnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onUnknownRoute: AppRoutes.onUnknownRoute,
    );
  }
}
