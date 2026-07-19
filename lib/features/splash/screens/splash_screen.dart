import 'package:eshop_app/assets.dart';
import 'package:eshop_app/features/on_boarding/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).go(OnboardingScreen.route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.logo_png, width: 200.w, height: 200.h),
      ),
    );
  }
}
