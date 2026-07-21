import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/otp_widget.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  const ForgotPasswordOtpScreen({super.key});
  static const String route = 'forgotPasswordOtp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).verify_identity,
          style: AppTextStyles.semiBold20(context),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                S.of(context).forget_password_otp_notice,
                style: AppTextStyles.regular16(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              const OtpWidget(),
              SizedBox(height: 60.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: S.of(context).verify,
                  onPressed: () {
                    GoRouter.of(context).push('/${ResetPasswordScreen.route}');
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).didnt_receive_code,
                    style: AppTextStyles.regular14(context),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).resend,
                      style: AppTextStyles.bold14(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
