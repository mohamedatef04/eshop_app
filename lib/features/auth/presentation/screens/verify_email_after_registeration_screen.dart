import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/didnot_recieve_otp_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/otp_input_field.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class VerifyEmailAfterRegisterationScreen extends StatefulWidget {
  const VerifyEmailAfterRegisterationScreen({super.key, required this.email});

  static const String route = '/verifyEmailAfterRegisteration';
  final String email;

  @override
  State<VerifyEmailAfterRegisterationScreen> createState() =>
      _VerifyEmailAfterRegisterationScreenState();
}

class _VerifyEmailAfterRegisterationScreenState
    extends State<VerifyEmailAfterRegisterationScreen> {
  String? otp;
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
              OtpInputField(
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
              SizedBox(height: 60.h),
              BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
                listener: (context, state) {
                  if (state is VerifyEmailSuccess) {
                    showToastificationBar(
                      context: context,
                      message: S.of(context).your_email_verified_successfully,
                      title: S.of(context).success,
                      type: ToastificationType.success,
                      color: AppColors.accent,
                      icon: Icons.check,
                    );
                    GoRouter.of(context).go(LoginScreen.route);
                  } else if (state is VerifyEmailError) {
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
                      isLoading: state is VerifyEmailLoading,
                      text: S.of(context).verify,
                      onPressed: () {
                        if (otp != null && otp!.length == 6) {
                          context
                              .read<VerifyEmailCubit>()
                              .verifyEmailAfterRegisteration(
                                otp: otp!,
                                email: widget.email,
                              );
                        } else {
                          showToastificationBar(
                            context: context,
                            message: S.of(context).please_enter_otp,
                            title: S.of(context).error,
                            type: ToastificationType.error,
                            color: AppColors.error,
                            icon: Icons.error,
                          );
                          return;
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
