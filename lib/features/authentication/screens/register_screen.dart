import 'package:flutter/material.dart';

import '../../../app/app_navigator.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../models/auth_user.dart';
import '../../../services/auth_service.dart';
import '../../../services/auth_service_provider.dart';

/// Screen for creating a new user account in MedReturn.
///
/// Features:
/// - Full Name, Email, Password, and Confirm Password fields
/// - Client-side form validation
/// - Integrated Firebase authentication
/// - Loading spinner and disabled states during network calls
/// - Accessible error feedback
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.authService});

  final AuthService? authService;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  AuthService get _authService =>
      widget.authService ?? AuthServiceProvider.instance;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onRegisterPressed() async {
    if (_isLoading) return;

    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _authService.registerWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
        displayName: _nameController.text.trim(),
      );

      if (mounted) {
        // Direct newly registered users into role onboarding
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
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: _isLoading ? null : () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppSpacing.screenPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Join MedReturn',
                    style: AppTextStyles.screenHeading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Safe medicine. Better access for everyone.',
                    style: AppTextStyles.screenSubtitle,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Full Name Field
                  AppTextField(
                    label: 'Full Name',
                    hintText: 'e.g. Robius Sani',
                    prefixIcon: Icons.person_outline,
                    controller: _nameController,
                    enabled: !_isLoading,
                    keyboardType: TextInputType.name,
                    validator: (v) =>
                        Validators.validateRequired(v, fieldName: 'Full name'),
                  ),

                  const SizedBox(height: AppSpacing.lg),

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

                  const SizedBox(height: AppSpacing.lg),

                  // Password Field
                  AppTextField(
                    label: AppStrings.passwordLabel,
                    hintText: 'At least 6 characters',
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

                  const SizedBox(height: AppSpacing.lg),

                  // Confirm Password Field
                  AppTextField(
                    label: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    prefixIcon: Icons.lock_outline,
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    enabled: !_isLoading,
                    validator: (v) => Validators.validateConfirmPassword(
                      v,
                      _passwordController.text,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.inputIcon,
                        size: AppSpacing.iconSize,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // Register Button
                  PrimaryButton(
                    text: 'Create Account',
                    isLoading: _isLoading,
                    onPressed: _onRegisterPressed,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Back to Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: AppTextStyles.caption,
                      ),
                      GestureDetector(
                        onTap: _isLoading
                            ? null
                            : () => Navigator.of(context).maybePop(),
                        child: const Text(
                          AppStrings.loginButton,
                          style: AppTextStyles.link,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
