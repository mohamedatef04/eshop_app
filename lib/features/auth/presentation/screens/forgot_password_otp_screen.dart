import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/validate_otp/validate_otp_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/didnot_recieve_otp_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/otp_input_field.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key, required this.email});
  static const String route = '/forgotPasswordOtp';
  final String email;

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  String? otpCode;

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
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              OtpInputField(
                onChanged: (code) {
                  setState(() {
                    otpCode = code;
                  });
                },
              ),
              SizedBox(height: 60.h),
              BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
                listener: (context, state) {
                  if (state is ValidateOtpSuccess) {
                    showToastificationBar(
                      context: context,
                      message: S.of(context).otp_verified_successfully,
                      title: S.of(context).success,
                      type: ToastificationType.success,
                      color: AppColors.accentDark,
                      icon: Icons.check_circle,
                    );

                    GoRouter.of(context).push(
                      ResetPasswordScreen.route,
                      extra: {
                        'email': widget.email,
                        'otp': otpCode!,
                      },
                    );
                  } else if (state is ValidateOtpError) {
                    showToastificationBar(
                      context: context,
                      message: state.errorMessage,
                      title: S.of(context).error,
                      type: ToastificationType.error,
                      color: AppColors.error,
                      icon: Icons.error,
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      isLoading: state is ValidateOtpLoading,
                      text: S.of(context).verify,
                      onPressed: () {
                        if (otpCode != null && otpCode!.length == 6) {
                          context.read<ValidateOtpCubit>().validateOtp(
                            email: widget.email,
                            otp: otpCode!,
                          );
                        } else {
                          showToastificationBar(
                            context: context,
                            message: S.of(context).please_enter_otp,
                            title: S.of(context).error,
                            type: ToastificationType.warning,
                            color: AppColors.warning,
                            icon: Icons.warning,
                          );
                        }
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
              DidNotReceiveOtpWidget(email: widget.email),
            ],
          ),
        ),
      ),
    );
  }
}
