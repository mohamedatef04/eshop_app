import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/or_login_with_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/social_login_button.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              SizedBox(height: 40.h),
              const _RegisterForm(),
              SizedBox(height: 20.h),
              const _LoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).register,
          style: AppTextStyles.bold24(context),
        ),
        SizedBox(height: 8.h),
        Text(
          S.of(context).create_exclusive_account,
          style: AppTextStyles.regular16(context).copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: S.of(context).first_name,
                hint: S.of(context).first_name_hint,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomTextField(
                label: S.of(context).last_name,
                hint: S.of(context).last_name_hint,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          label: S.of(context).email,
          hint: S.of(context).email_hint,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          label: S.of(context).password,
          hint: S.of(context).password_hint,
          obscureText: true,
        ),
        SizedBox(height: 32.h),
        Center(
          child: CustomElevatedButton(
            text: S.of(context).create_account,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 32.h),
        OrLoginWithWidget(text: S.of(context).or_register_with_email),
        SizedBox(height: 32.h),
        Center(
          child: SocialLoginButton(
            text: S.of(context).continue_with_google,
            icon: Icon(
              Icons.g_mobiledata,
              size: 32.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _LoginPrompt extends StatelessWidget {
  const _LoginPrompt();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).already_have_account,
          style: AppTextStyles.regular14(context),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            S.of(context).login,
            style: AppTextStyles.bold14(context).copyWith(),
          ),
        ),
      ],
    );
  }
}
