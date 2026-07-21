import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});
  static const String route = 'passwordResetSuccess';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 100.sp,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              SizedBox(height: 32.h),
              Text(
                S.of(context).password_reset_successful,
                style: AppTextStyles.bold24(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).password_reset_successful_desc,
                style: AppTextStyles.regular16(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: S.of(context).back_to_login,
                  onPressed: () {
                    // Navigate back to login screen and clear history
                    GoRouter.of(context).go(LoginScreen.route);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
