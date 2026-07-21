import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());
  final AuthRepo authRepo;
  Future<void> verifyEmailAfterRegisteration({
    required String email,
    required String otp,
  }) async {
    safeEmit(VerifyEmailLoading());
    final result = await authRepo.verifyEmailAfterRegisteration(
      email: email,
      otp: otp,
    );
    result.fold(
      (failure) {
        safeEmit(VerifyEmailError(errorMessage: failure.errorMessage));
      },
      (r) {
        safeEmit(VerifyEmailSuccess());
      },
    );
  }
}
