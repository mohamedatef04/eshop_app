import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/utils/validator.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/forget_pass/forget_pass_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_otp_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String route = '/forgotPassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).forgot_password,
          style: AppTextStyles.semiBold20(context),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).forgot_password_desc,
                  style: AppTextStyles.regular16(context).copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  controller: emailController,
                  label: S.of(context).email_address,
                  hint: S.of(context).email_hint,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmail(context, value),
                ),
                SizedBox(height: 60.h),
                SizedBox(
                  width: double.infinity,
                  child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
                    listener: (context, state) {
                      if (state is ForgetPassSuccess) {
                        GoRouter.of(
                          context,
                        ).push(
                          ForgotPasswordOtpScreen.route,
                          extra: emailController.text.trim(),
                        );
                        showToastificationBar(
                          context: context,
                          message: S.of(context).forget_password_otp_notice,
                          title: S.of(context).success,
                          type: ToastificationType.success,
                          color: AppColors.accentDark,
                          icon: Icons.check_circle_outline,
                        );
                      } else if (state is ForgetPassError) {
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
                      return CustomElevatedButton(
                        isLoading: state is ForgetPassLoading,
                        text: S.of(context).send_code,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<ForgetPassCubit>().forgetPass(
                              email: emailController.text.trim(),
                            );
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
