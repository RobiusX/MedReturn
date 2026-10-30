import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';

/// Root application widget for MedReturn.
///
/// Configures the MaterialApp with theming, routing, and
/// top-level application settings. All feature screens will
/// be connected through the routing configuration.
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
      home: const Scaffold(
        body: Center(
          child: Text(AppStrings.appName),
        ),
      ),
    );
  }
}

