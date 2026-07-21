import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/screens/verify_email_after_registeration_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/or_login_with_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/social_login_button.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
            onPressed: () {
              GoRouter.of(
                context,
              ).push(VerifyEmailAfterRegisterationScreen.route);
            },
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
