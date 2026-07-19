import 'dart:ui';

class OnboardingItemModel {
  final String image;
  final String buttonText;
  final VoidCallback onPressed;

  OnboardingItemModel({
    required this.image,
    required this.buttonText,
    required this.onPressed,
  });
}
