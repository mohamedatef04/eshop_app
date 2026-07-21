import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/screens/password_reset_success_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const String route = '/resetPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).reset_password,
          style: AppTextStyles.semiBold20(context),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).new_password_desc,
                style: AppTextStyles.regular16(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: S.of(context).new_password,
                hint: S.of(context).password_hint,
                obscureText: true,
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).must_be_at_least_8_chars,
                style: AppTextStyles.regular12(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: S.of(context).confirm_password,
                hint: S.of(context).password_hint,
                obscureText: true,
              ),
              SizedBox(height: 60.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: S.of(context).reset_password,
                  onPressed: () {
                    GoRouter.of(context).push(PasswordResetSuccessScreen.route);
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
