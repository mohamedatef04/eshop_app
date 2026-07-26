import 'package:eshop_app/features/auth/presentation/widgets/login/dont_have_an_account_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/login_form_widget.dart';
import 'package:eshop_app/features/auth/presentation/widgets/login/login_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeaderWidget(),
              SizedBox(height: 40.h),
              const LoginFormWidget(),
              SizedBox(height: 20.h),
              const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
