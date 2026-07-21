import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/widgets/toastfication.dart';
import 'package:eshop_app/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class DidNotReceiveOtpWidget extends StatelessWidget {
  const DidNotReceiveOtpWidget({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).didnt_receive_code,
          style: AppTextStyles.regular14(context),
        ),
        BlocConsumer<ResendOtpCubit, ResendOtpState>(
          listener: (context, state) {
            if (state is ResendOtpSuccess) {
              showToastificationBar(
                context: context,
                message: S
                    .of(context)
                    .an_otp_has_been_sent_to_your_email_address,
                title: S.of(context).success,
                type: ToastificationType.success,
                color: AppColors.accent,
                icon: Icons.check_circle,
              );
            } else if (state is ResendOtpError) {
              showToastificationBar(
                context: context,
                message: state.errorMessage,
                title: S.of(context).error,
                type: ToastificationType.error,
                color: Colors.red,
                icon: Icons.error,
              );
            }
          },
          builder: (context, state) {
            return TextButton(
              child: state is ResendOtpLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: AppColors.accentDark,
                      ),
                    )
                  : Text(
                      S.of(context).resend,
                      style: AppTextStyles.bold14(context),
                    ),
              onPressed: () {
                context.read<ResendOtpCubit>().resendOtp(email: email);
              },
            );
          },
        ),
      ],
    );
  }
}
