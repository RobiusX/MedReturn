import 'package:flutter/material.dart';

import '../../app/app_navigator.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';
import 'primary_button.dart';

/// Screen displayed when an invalid or unknown route is requested.
class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key, this.routeName});

  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Page Not Found')),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.warning,
              ),
              const SizedBox(height: AppSpacing.xl),
              const Text(
                'Route Not Found',
                style: AppTextStyles.screenHeading,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                routeName != null
                    ? 'The route "$routeName" does not exist.'
                    : 'The requested screen could not be found.',
                style: AppTextStyles.screenSubtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxxl),
              PrimaryButton(
                text: 'Back to Login',
                onPressed: () =>
                    AppNavigator.pushReplacementNamed(context, '/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
