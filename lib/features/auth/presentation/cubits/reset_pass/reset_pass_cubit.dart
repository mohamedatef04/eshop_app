import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.authRepo) : super(ResetPassInitial());
  final AuthRepo authRepo;
  Future<void> resetPass({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    safeEmit(ResetPassLoading());
    final result = await authRepo.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
    result.fold(
      (fail) => safeEmit(ResetPassError(errorMessage: fail.errorMessage)),
      (r) => safeEmit(ResetPassSuccess()),
    );
  }
}
