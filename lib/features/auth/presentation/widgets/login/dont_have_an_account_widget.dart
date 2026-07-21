import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/features/auth/presentation/screens/register_screen.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dont_have_account,
          style: AppTextStyles.regular14(context),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(RegisterScreen.route);
          },
          child: Text(
            S.of(context).register,
            style: AppTextStyles.bold14(context).copyWith(),
          ),
        ),
      ],
    );
  }
}
