import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/register_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/verify_email_after_registeration_screen.dart';
import 'package:eshop_app/features/on_boarding/screens/onboarding_screen.dart';
import 'package:eshop_app/features/splash/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: OnboardingScreen.route,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RegisterScreen.route,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: VerifyEmailAfterRegisterationScreen.route,
          builder: (context, state) =>
              const VerifyEmailAfterRegisterationScreen(),
        ),
      ],
    ),
  ],
);
