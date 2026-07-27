import 'package:eshop_app/assets.dart';
import 'package:eshop_app/core/services/shared_pref_service.dart';
import 'package:eshop_app/core/utils/constants.dart';
import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/features/on_boarding/models/onboarding_item_model.dart';
import 'package:eshop_app/features/on_boarding/widgets/onboarding_item.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String route = '/';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<OnboardingItemModel> onBoardingItems = [
      OnboardingItemModel(
        image: Assets.images.onboarding_1_png,
        buttonText: S.of(context).next,
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
      ),
      OnboardingItemModel(
        image: Assets.images.onboarding_2_png,
        buttonText: S.of(context).get_started,
        onPressed: () async {
          await SharedPrefrenceService.setBool(
            AppConstants.onboardingKey,
            true,
          );
          GoRouter.of(context).go(LoginScreen.route);
        },
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onBoardingItems.length,
        itemBuilder: (context, index) {
          return OnboardingItem(
            onboardingItemModel: onBoardingItems[index],
          );
        },
      ),
    );
  }
}
