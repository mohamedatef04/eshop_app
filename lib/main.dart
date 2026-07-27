import 'package:eshop_app/core/routes/app_router.dart';
import 'package:eshop_app/core/services/get_it_.dart';
import 'package:eshop_app/core/services/shared_pref_service.dart';
import 'package:eshop_app/core/theme/app_theme.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupLocator();
  await SharedPrefrenceService.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
