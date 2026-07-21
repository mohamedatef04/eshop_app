import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/auth/presentation/widgets/didnot_recieve_otp_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/otp_widget.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class VerifyEmailAfterRegisterationScreen extends StatelessWidget {
  const VerifyEmailAfterRegisterationScreen({super.key});
  static const String route = '/verifyEmailAfterRegisteration';

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
                S.of(context).an_otp_has_been_sent_to_your_email_address,
                style: AppTextStyles.regular16(context).copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
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
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 24.h),
              const DidNotReceiveOtpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
