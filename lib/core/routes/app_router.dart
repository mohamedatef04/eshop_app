import 'package:eshop_app/core/services/get_it_.dart';
import 'package:eshop_app/core/services/shared_pref_service.dart';
import 'package:eshop_app/core/utils/constants.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:eshop_app/features/auth/presentation/cubits/forget_pass/forget_pass_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/reset_pass/reset_pass_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/validate_otp/validate_otp_cubit.dart';
import 'package:eshop_app/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_otp_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/login_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/password_reset_success_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/register_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eshop_app/features/auth/presentation/screens/verify_email_after_registeration_screen.dart';
import 'package:eshop_app/features/home/data/models/product_model.dart';
import 'package:eshop_app/features/home/presentation/screens/home_screen.dart';
import 'package:eshop_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:eshop_app/features/main/cubit/nav_bar_cubit.dart';
import 'package:eshop_app/features/main/root_screen.dart';
import 'package:eshop_app/features/on_boarding/screens/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
      redirect: (context, state) async {
        bool isOnBoardingCompleted = await SharedPrefrenceService.getBool(
          AppConstants.onboardingKey,
        );
        const FlutterSecureStorage storage = FlutterSecureStorage();
        String? token = await storage.read(key: AppConstants.refreshTokenKey);

        if (state.uri.path == '/') {
          if (isOnBoardingCompleted) {
            if (token != null) {
              return RootScreen.route;
            } else {
              return LoginScreen.route;
            }
          } else {
            return OnboardingScreen.route;
          }
        }

        // If logged in and trying to go to login or onboarding, redirect to root
        if (token != null &&
            (state.uri.path == LoginScreen.route ||
                state.uri.path == OnboardingScreen.route ||
                state.uri.path == RegisterScreen.route)) {
          return RootScreen.route;
        }

        // Allow all other routes (like /product_details) to proceed normally
        return null;
      },
      routes: [
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
          builder: (context, state) => BlocProvider(
            create: (context) => ForgetPassCubit(getIt<AuthRepo>()),
            child: const ForgotPasswordScreen(),
          ),
        ),
        GoRoute(
          path: ForgotPasswordOtpScreen.route,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ValidateOtpCubit(getIt<AuthRepo>()),
              ),
              BlocProvider(
                create: (context) => ResendOtpCubit(getIt<AuthRepo>()),
              ),
            ],
            child: ForgotPasswordOtpScreen(
              email: state.extra as String,
            ),
          ),
        ),
        GoRoute(
          path: ResetPasswordScreen.route,
          builder: (context, state) {
            final args = state.extra as Map<String, String>;
            return BlocProvider(
              create: (context) => ResetPassCubit(getIt<AuthRepo>()),
              child: ResetPasswordScreen(
                email: args['email']!,
                otp: args['otp']!,
              ),
            );
          },
        ),
        GoRoute(
          path: PasswordResetSuccessScreen.route,
          builder: (context, state) => const PasswordResetSuccessScreen(),
        ),
        GoRoute(
          path: RootScreen.route,
          builder: (context, state) => BlocProvider(
            create: (context) => NavBarCubit(),
            child: const RootScreen(),
          ),
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: ProductDetailsScreen.route,
          builder: (context, state) => ProductDetailsScreen(
            productModel: state.extra as ProductModel,
          ),
        ),
      ],
    ),
  ],
);
