import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class DidNotReceiveOtpWidget extends StatelessWidget {
  const DidNotReceiveOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).didnt_receive_code,
          style: AppTextStyles.regular14(context),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).resend,
            style: AppTextStyles.bold14(context),
          ),
        ),
      ],
    );
  }
}
