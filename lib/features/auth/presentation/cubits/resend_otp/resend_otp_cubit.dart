import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this.authRepo) : super(ResendOtpInitial());

  final AuthRepo authRepo;

  Future<void> resendOtp({required String email}) async {
    safeEmit(ResendOtpLoading());
    final result = await authRepo.resendOtp(
      email: email,
    );
    result.fold(
      (failure) {
        safeEmit(ResendOtpError(errorMessage: failure.errorMessage));
      },
      (r) {
        safeEmit(ResendOtpSuccess());
      },
    );
  }
}
