import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/or_login_with_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/social_login_button.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        SizedBox(height: 12.h),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).push(ForgotPasswordScreen.route);
            },
            child: Text(
              S.of(context).forgot_password,
              style: AppTextStyles.medium14(context),
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Center(
          child: CustomElevatedButton(
            text: S.of(context).login,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 32.h),
        OrLoginWithWidget(text: S.of(context).or_login_with_email),
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
