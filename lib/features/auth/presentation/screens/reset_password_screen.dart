import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/utils/validator.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/reset_pass/reset_pass_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/password_reset_success_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });
  static const String route = '/resetPassword';
  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
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
                  controller: passwordController,
                  label: S.of(context).new_password,
                  hint: S.of(context).password_hint,
                  obscureText: isPasswordHidden,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                  ),
                  validator: (value) =>
                      Validator.validatePassword(context, value),
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
                  controller: confirmPasswordController,
                  label: S.of(context).confirm_password,
                  hint: S.of(context).password_hint,
                  obscureText: isConfirmPasswordHidden,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      });
                    },
                  ),
                  validator: (value) => Validator.validateConfirmPassword(
                    context,
                    value,
                    passwordController.text,
                  ),
                ),
                SizedBox(height: 60.h),
                BlocConsumer<ResetPassCubit, ResetPassState>(
                  listener: (context, state) {
                    if (state is ResetPassSuccess) {
                      GoRouter.of(
                        context,
                      ).push(PasswordResetSuccessScreen.route);
                    } else if (state is ResetPassError) {
                      showToastificationBar(
                        context: context,
                        message: state.errorMessage,
                        title: S.of(context).error,
                        type: ToastificationType.error,
                        color: Colors.red,
                        icon: Icons.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        isLoading: state is ResetPassLoading,
                        text: S.of(context).reset_password,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<ResetPassCubit>().resetPass(
                              email: widget.email,
                              otp: widget.otp,
                              newPassword: passwordController.text.trim(),
                            );
                          } else {
                            autovalidateMode =
                                AutovalidateMode.onUserInteraction;
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
