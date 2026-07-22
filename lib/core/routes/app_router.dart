import 'package:eshop_app/core/services/get_it_.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:eshop_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_otp_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/password_reset_success_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/register_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/verify_email_after_registeration_screen.dart';
import 'package:eshop_app/features/on_boarding/screens/onboarding_screen.dart';
import 'package:eshop_app/features/splash/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          builder: (context, state) => BlocProvider(
            create: (context) => LoginCubit(getIt<AuthRepo>()),
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: RegisterScreen.route,
          builder: (context, state) => BlocProvider(
            create: (context) => RegisterCubit(getIt<AuthRepo>()),
            child: const RegisterScreen(),
          ),
        ),
        GoRoute(
          path: VerifyEmailAfterRegisterationScreen.route,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => VerifyEmailCubit(getIt<AuthRepo>()),
              ),
              BlocProvider(
                create: (context) => ResendOtpCubit(getIt<AuthRepo>()),
              ),
            ],
            child: VerifyEmailAfterRegisterationScreen(
              email: state.extra as String,
            ),
          ),
        ),
        GoRoute(
          path: ForgotPasswordScreen.route,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: ForgotPasswordOtpScreen.route,
          builder: (context, state) => const ForgotPasswordOtpScreen(),
        ),
        GoRoute(
          path: ResetPasswordScreen.route,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        GoRoute(
          path: PasswordResetSuccessScreen.route,
          builder: (context, state) => const PasswordResetSuccessScreen(),
        ),
      ],
    ),
  ],
);
