import 'package:eshop_app/features/auth/presentation/widgets/register/already_have_an_account_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/register/register_form.dart';
import 'package:eshop_app/features/auth/presentation/widgets/register/register_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterHeaderWidget(),
              SizedBox(height: 40.h),
              const RegisterForm(),
              SizedBox(height: 20.h),
              const AlreadyHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
