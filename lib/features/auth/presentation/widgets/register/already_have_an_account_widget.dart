import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).already_have_account,
          style: AppTextStyles.regular14(context),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            S.of(context).login,
            style: AppTextStyles.bold14(context).copyWith(),
          ),
        ),
      ],
    );
  }
}
