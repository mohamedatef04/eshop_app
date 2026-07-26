import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:eshop_app/features/auth/data/models/login_response_model.dart';
import 'package:eshop_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    safeEmit(LoginLoadingState());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (l) {
        safeEmit(LoginErrorState(errorMessage: l.errorMessage));
      },
      (r) {
        safeEmit(LoginSuccessState(loginResponseModel: r));
      },
    );
  }
}
