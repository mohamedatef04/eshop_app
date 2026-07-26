import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  ValidateOtpCubit(this.authRepo) : super(ValidateOtpInitial());
  final AuthRepo authRepo;
  Future<void> validateOtp({required String email, required String otp}) async {
    safeEmit(ValidateOtpLoading());
    final result = await authRepo.validateOtp(email: email, otp: otp);
    result.fold(
      (fail) => safeEmit(ValidateOtpError(errorMessage: fail.errorMessage)),
      (r) => safeEmit(ValidateOtpSuccess()),
    );
  }
}
