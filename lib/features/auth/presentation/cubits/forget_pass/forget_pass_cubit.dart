import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.authRepo) : super(ForgetPassInitial());
  final AuthRepo authRepo;
  Future<void> forgetPass({required String email}) async {
    safeEmit(ForgetPassLoading());
    final result = await authRepo.forgetPassword(email: email);
    result.fold(
      (fail) => safeEmit(ForgetPassError(errorMessage: fail.errorMessage)),
      (r) => safeEmit(ForgetPassSuccess()),
    );
  }
}
