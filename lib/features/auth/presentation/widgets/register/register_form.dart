import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/utils/validator.dart';
import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/data/models/register_request_model.dart';
import 'package:eshop_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/verify_email_after_registeration_screen.dart';
import 'package:eshop_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/or_login_with_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/social_login_button.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool _isPasswordObscured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _firstNameController,
                  label: S.of(context).first_name,
                  hint: S.of(context).first_name_hint,
                  validator: (value) => Validator.validateName(context, value),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomTextField(
                  controller: _lastNameController,
                  label: S.of(context).last_name,
                  hint: S.of(context).last_name_hint,
                  validator: (value) => Validator.validateName(context, value),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            controller: _emailController,
            label: S.of(context).email,
            hint: S.of(context).email_hint,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(context, value),
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            controller: _passwordController,
            label: S.of(context).password,
            hint: S.of(context).password_hint,
            obscureText: _isPasswordObscured,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordObscured = !_isPasswordObscured;
                });
              },
              icon: _isPasswordObscured
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            validator: (value) => Validator.validatePassword(context, value),
          ),
          SizedBox(height: 32.h),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showToastificationBar(
                  context: context,
                  message: S.of(context).account_created_successfully,
                  title: S.of(context).success,
                  type: ToastificationType.success,
                  color: AppColors.backgroundDark,
                  icon: Icons.check,
                );
                GoRouter.of(context).push(
                  VerifyEmailAfterRegisterationScreen.route,
                  extra: _emailController.text.trim(),
                );
              } else if (state is RegisterFailure) {
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
                  isLoading: state is RegisterLoading,
                  text: S.of(context).create_account,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<RegisterCubit>().register(
                        registerRequestModel: RegisterRequestModel(
                          firstName: _firstNameController.text.trim(),
                          lastName: _lastNameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
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
      ),
    );
  }
}
