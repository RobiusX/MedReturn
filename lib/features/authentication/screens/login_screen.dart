import 'package:flutter/material.dart';

import '../../../app/app_navigator.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/med_return_logo.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../models/auth_user.dart';
import '../../../services/auth_service.dart';
import '../../../services/auth_service_provider.dart';

/// Screen 1: Login Screen
///
/// Reproduces the Figma design with pixel precision:
/// - Centered gradient logo pill with tagline
/// - Labeled email and password fields with leading icons
/// - Centralized form validation using [Validators]
/// - Full-width electric blue button (12dp radius, 48dp height)
/// - Integrated Firebase authentication with loading and error states
/// - Register link at the bottom
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.authService});

  final AuthService? authService;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  AuthService get _authService =>
      widget.authService ?? AuthServiceProvider.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    if (_isLoading) return;

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _authService.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        AppNavigator.toRoleSelection(context);
      }
    } on AuthException catch (e) {
      if (mounted) {
        _showErrorSnackBar(e.message);
      }
    } catch (_) {
      if (mounted) {
        _showErrorSnackBar('An unexpected error occurred. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _onRegisterPressed() {
    if (_isLoading) return;
    AppNavigator.toRegister(context);
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.textWhite,
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.xxxl),

                  // Logo and Tagline
                  const Center(child: MedReturnLogo()),

                  const SizedBox(height: AppSpacing.huge),

                  // Email Address Field
                  AppTextField(
                    label: AppStrings.emailAddressLabel,
                    hintText: AppStrings.emailHint,
                    prefixIcon: Icons.mail_outline,
                    controller: _emailController,
                    enabled: !_isLoading,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Password Field
                  AppTextField(
                    label: AppStrings.passwordLabel,
                    hintText: AppStrings.passwordHint,
                    prefixIcon: Icons.lock_outline,
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    enabled: !_isLoading,
                    validator: Validators.validatePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.inputIcon,
                        size: AppSpacing.iconSize,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxxl),

                  // Login Button with Loading State
                  PrimaryButton(
                    text: AppStrings.loginButton,
                    isLoading: _isLoading,
                    onPressed: _onLoginPressed,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Register Link Prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '${AppStrings.newToMedReturn} ',
                        style: AppTextStyles.caption,
                      ),
                      GestureDetector(
                        onTap: _onRegisterPressed,
                        child: const Text(
                          AppStrings.register,
                          style: AppTextStyles.link,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
