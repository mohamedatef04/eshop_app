import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/utils/constants.dart';
import 'package:eshop_app/core/utils/validator.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/or_login_with_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/social_login_button.dart';
import 'package:eshop_app/features/main/root_screen.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool obscureText = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: emailController,
            label: S.of(context).email,
            hint: S.of(context).email_hint,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(context, value),
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            controller: passwordController,
            label: S.of(context).password,
            hint: S.of(context).password_hint,
            obscureText: obscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: obscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            validator: (value) => Validator.validatePassword(context, value),
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
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccessState) {
                const storage = FlutterSecureStorage();
                await storage.write(
                  key: AppConstants.accessTokenKey,
                  value: state.loginResponseModel.accessToken,
                );
                await storage.write(
                  key: AppConstants.refreshTokenKey,
                  value: state.loginResponseModel.refreshToken,
                );
                GoRouter.of(context).go(RootScreen.route);
              } else if (state is LoginErrorState) {
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
              return Center(
                child: CustomElevatedButton(
                  isLoading: state is LoginLoadingState,
                  text: S.of(context).login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<LoginCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              );
            },
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
      ),
    );
  }
}
