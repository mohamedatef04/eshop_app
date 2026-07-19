import 'package:eshop_app/core/widgets/custom_elevated_button.dart';
import 'package:eshop_app/features/on_boarding/models/onboarding_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingItemModel});
  final OnboardingItemModel onboardingItemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardingItemModel.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
          child: SafeArea(
            child: CustomElevatedButton(
              text: onboardingItemModel.buttonText,
              onPressed: onboardingItemModel.onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
